# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class WebsiteService < Service

          attributes :context

          def call
            @page = context['page']
            @site = context['site']
            @lang = @page['lang']
            @website = @site['seo']['website']

            {
              "@type": "WebSite",
              "@id": id,
              "url": url,
              "name": @website['name'],
              "description": '',
              "publisher": publisher
            }
          end

          private

          def id
            return '/#website' if @lang == ''

            "/#{@lang}/#website"
          end

          def url
            ['/', @lang, '/'].join.sub('//', '/')
          end

          def publisher
            {
              "@id": "#{url}#organization"
            }
          end
        end
      end
    end
  end
end
