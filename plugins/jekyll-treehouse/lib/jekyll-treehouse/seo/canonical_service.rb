# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      class CanonicalService < Service
        attributes :context

        def call
          @site = context['site']
          @page = context['page']

          ['<link rel="canonical" href="', canonical_url, '" />'].join unless canonical_url.to_s.empty?
        end

        private

        def canonical_url
          begin
            if @page["canonical_url"].to_s.empty?
              filters.absolute_url(@page["url"]).to_s.gsub(%r!/index\.html$!, "/")
            else
              @page["canonical_url"]
            end
          end
        end

        def filters
          @filters ||= Jekyll::SeoTag::Filters.new(context)
        end
      end
    end
  end
end
