# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class CollectionService < Service

          attributes :context

          def call
            @page = context['page']
            @lang = @page['lang']

            {
              "@type": "CollectionPage",
              "@id": id,
              "url": url,
              "inLanguage": in_language,
              "name": name,
              "isPartOf": is_part_of,
              "description": description,
            }
          end

          private


          def id
            "#{@page['url']}#webpage"
          end

          def url
            @page['url']
          end

          def in_language
            @page['full-lang']
          end

          def name
            @page['title']
          end

          def is_part_of
            base_url = ['/', @lang, '/'].join.sub('//', '/')

            {
              "@id": "#{base_url}#website"
            }
          end

          def description
            @page['description']
          end
        end
      end
    end
  end
end
