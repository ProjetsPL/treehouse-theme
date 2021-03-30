# frozen_string_literal: true
require 'digest'

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class ContentFaqService < Service
          attributes :context

          PUNCTUATION_REGEXP = /[^\p{Word}\- ]/u

          def call
            @page = context['page']
            @doc = Nokogiri::HTML::DocumentFragment.parse(context['page']['content'])

            questions = prepare_questions
            return [] if questions.count.zero?

            question_array = []

            questions.each_with_index do |question, i|
              question_array << question(question: question, i: i)
            end

            {
              "@context": "https://schema.org",
              "@type": "FAQPage",
              "mainEntity": question_array
            }
          end

          private

          def prepare_questions
            @doc.search('.faq-item').map do |faq_item|
              name = faq_item.search('.faq-question')[0].text.gsub("\n", '')
              answer = faq_item.search('.faq-answer')[0].text.gsub("\n", '')
              id = name.downcase.gsub(PUNCTUATION_REGEXP, '').tr(' ', '-')

              {
                name: name,
                answer: answer,
                id: "#{@page['url']}##{id}"
              }
            end
          end

          # def overview(questions: )
          #   [
          #     {
          #       "@type": "ItemList",
          #       "mainEntityOfPage": {
          #         "@id": "#{@page['url']}#article"
          #       },
          #       "numberOfItems": questions.count,
          #       "itemListElement": questions.map do |question|
          #         {
          #           "@id": question[:id]
          #         }
          #       end
          #     }
          #   ]
          # end

          def question(question: , i: )
            {
              "@type": "Question",
              "@id": question[:id],
              "position": i,
              "url": question[:id],
              "name": question[:name],
              "answerCount": 1,
              "acceptedAnswer": {
                "@type": "Answer",
                "text": question[:answer]
              }
            }
          end
        end
      end
    end
  end
end
