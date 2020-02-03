# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class ArticleService < Service

          attributes :context

          def call
            @site = context['site']
            @page = context['page']
            @lang = @page['lang']
            @person = @site['seo']['person']

            {
              "@type": "Article",
              "@id": id,
              "isPartOf": is_part_of,
              "author": author,
              "headline": headline,
              "datePublished": date_published,
              "dateModified": date_modified,
              "commentCount": comment_count,
              "mainEntityOfPage": main_entity_of_page,
              "publisher": publisher,
              "image": image,
              "articleSection": article_section
              # "aggregateRating": aggregate_rating
            }
          end

          private

          def id
            "#{@page['url']}#article"
          end

          def is_part_of
            {
              "@id": "#{@page['url']}#webpage"
            }
          end

          def author
            base_url = ['/', @lang, '/'].join.sub('//', '/')

            {
              "@id": "#{base_url}##{@person['id']}"
            }
          end

          def headline
            @page['title']
          end

          def date_published
            @page['date']
          end

          def date_modified
            @page['date']
          end

          def comment_count
            0
          end

          def main_entity_of_page
            {
              "@id": "#{@page['url']}#webpage"
            }
          end

          def publisher
            base_url = ['/', @lang, '/'].join.sub('//', '/')

            {
              "@id": "#{base_url}#organization"
            }
          end

          def image
            {
              "@id": "#{@page['url']}#primaryimage"
            }
          end

          def article_section
            ""
          end

          def aggregate_rating
            {
              "@type": "AggregateRating",
              "ratingValue": "4.5",
              "reviewCount": 8
            }
          end
        end
      end
    end
  end
end
