# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class OrganizationService < Service

          attributes :context

          def call
            @page = context['page']
            @site = context['site']
            @lang = @page['lang']
            @organization = @site['seo']['organization']

            {
              "@type": "Organization",
              "@id": id,
              "name": @site['author']['name'],
              "url": url,
              "sameAs": same_as,
              "logo": logo,
              "image": image
            }
          end

          private

          def id
            return '/#organization' if @lang == ''

            "/#{@lang}/#organization"
          end

          def url
            ['/', @lang, '/'].join.sub('//', '/')
          end

          def same_as
            [@site['seo']['same_as']].flatten.compact
          end

          def logo
            {
              "@type": "ImageObject",
              "@id": "#{url}#logo",
              "url": @organization['logo']['url'],
              "width": @organization['logo']['width'],
              "height": @organization['logo']['height'],
              "caption": @organization['name']
            }
          end

          def image
            {
              "@id": "#{url}#logo"
            }
          end
        end
      end
    end
  end
end
