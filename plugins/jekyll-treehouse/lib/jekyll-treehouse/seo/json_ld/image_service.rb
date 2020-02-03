# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class ImageService < Service

          attributes :context

          def call
            @page = context['page']

            {
              "@type": "ImageObject",
              "@id": id,
              "url": url,
              "width": 800,
              "height": 500
            }
          end

          private

          def id
            "#{@page['url']}#primaryimage"
          end

          def url
            @page['image']
          end
        end
      end
    end
  end
end
