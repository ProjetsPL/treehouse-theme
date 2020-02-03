# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class BreadcrumbService < Service

          attributes :context

          def call
            {
              "@type": "BreadcrumbList",
              "@id": "/pl/blog/targi-pracy-w-polsce.html#breadcrumb",
              "itemListElement": [
                {
                  "@type": "ListItem",
                  "position":1,
                  "item": {
                  "@type": "WebPage",
                  "@id": "/pl/",
                  "url": "/pl/",
                  "name": "pl"
                  }
                },
                {
                  "@type": "ListItem",
                  "position":2,
                  "item": {
                    "@type": "WebPage",
                    "@id": "/pl/cat/praca",
                    "url": "/pl/cat/praca",
                    "name": "Praca"
                  }
                },
                {
                  "@type": "ListItem",
                  "position":3,
                  "item": {
                    "@type": "WebPage",
                    "@id": "/pl/blog/targi-pracy-w-polsce.html",
                    "url": "/pl/blog/targi-pracy-w-polsce.html",
                    "name": "Targi Pracy w Polsce \u2014 Ranking. [Najlepsi pracodawcy w zasi\u0119gu r\u0119ki]"
                  }
                }
              ]
            }
          end
        end
      end
    end
  end
end
