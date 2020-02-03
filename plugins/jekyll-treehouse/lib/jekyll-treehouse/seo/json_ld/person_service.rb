# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      module JsonLd
        class PersonService < Service

          attributes :context

          def call
            @page = context['page']
            @site = context['site']
            @lang = @page['lang']
            @person = @site['seo']['person']

            {
              "@type": ["Person"],
              "@id": id,
              "name": name,
              "sameAs": []
            }
          end

          private

          def id
            base_url = ['/', @lang, '/'].join.sub('//', '/')

            "#{base_url}##{@person['id']}"
          end

          def name
            @person['name']
          end
        end
      end
    end
  end
end
