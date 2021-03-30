# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class WebpageService < Service

          attributes :context

          def call
            @page = context['page']
            @lang = @page['lang']

            {
              "@type": "WebPage",
              "@id": id,
              "url": url,
              "inLanguage": in_language,
              "name": name,
              "isPartOf": is_part_of,
              "primaryImageOfPage": primary_image_of_page,
              "datePublished": date_published,
              "dateModified": date_modified,
              "description": description
              # "breadcrumb": breadcrumb
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

          def primary_image_of_page
            {
              "@id": "#{url}#primaryimage"
            }
          end

          def date_published
            Time.parse([@page['date'].to_s.split(' ')[0], "12:00:00", "+0100T"].join(' '))
          end

          def date_modified
            update_date = @page['update_date']

            return date_published if update_date.nil?

            Time.parse([update_date.to_s, "12:00:00", "+0100T"].join(' '))
          end

          def description
            @page['description']
          end

          def breadcrumb
            {
              "@id": "#{url}#breadcrumb"
            }
          end
        end
      end
    end
  end
end
