# frozen_string_literal: true
require 'digest'

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class RankingFaqService < Service
          attributes :context

          PUNCTUATION_REGEXP = /[^\p{Word}\- ]/u

          def call
            @page = context['page']
            @site = context['site']

            return [] if @page['product_filters'].nil?

            @product_filters = @page['product_filters'].split('|').map{ |x| x.split(':') }
            products = @context.registers[:site].collections["products"].docs

            @product_filters.each do |product_filter|
              products = products.select do |product|
                structure = JSON.parse(product.data.to_json, object_class: OpenStruct)
                key = product_filter[0]
                value = product_filter[1]

                product_value = structure.instance_eval(key)
                next(false) if product_value.nil?

                if product_value.is_a? Array
                  next(false) unless product_value.include? value
                else
                  next(false) if product_value != value
                end

                next(true)
              end
            end

            questions = prepare_questions(products: products)
            return [] if questions.count.zero?

            array = []
            array << overview(questions: questions)

            questions.each_with_index do |question, i|
              array << question(question: question, i: i)
            end

            array
          end

          private

          def prepare_questions(products: )
            i = 0
            products.sort_by { |x| x["name"] }.map do |product|
              name = product["name"]
              # name = ["📍 ", name].join
              name = [name, name_postfix].compact.join(" ")

              description = [product["description"][0..150], '...'].join
              id = name.downcase.gsub(PUNCTUATION_REGEXP, '').tr(' ', '-')
              i = i + 1

              {
                name: name,
                answer: description,
                id: "#{@page['url']}##{id}"
              }
            end
          end

          def name_postfix
            return nil if @product_filters.count < 2
            key = @product_filters[1][0]
            splitted_key = key.split('.')
            return nil if @product_filters.count < 2

            return nil if splitted_key[1] == "brand"

            @product_filters[1][1].to_s.capitalize
          end

          def overview(questions: )
            [
              {
                "@type": "ItemList",
                "mainEntityOfPage": {
                  "@id": "#{@page['url']}#article"
                },
                "numberOfItems": questions.count,
                "itemListElement": questions.map do |question|
                  {
                    "@id": question[:id]
                  }
                end
              }
            ]
          end

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
