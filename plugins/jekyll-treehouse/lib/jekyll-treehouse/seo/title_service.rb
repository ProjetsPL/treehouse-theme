# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      class TitleService < Service
        attributes :context

        TITLE_SEPARATOR = ' | '

        def call
          @site = context['site']
          @page = context['page']

          title = if site_title && page_title != site_title
            page_title
          elsif site_description && site_title
            site_title
          else
            page_title || site_title
          end

          # return page_number + @title if page_number

          ['<title>', title, '</title>'].join
        end

        private

        def site_title
          @site_title ||= @site["title"] || @site["name"]
        end

        def site_tagline
          @site_tagline ||= @site["tagline"]
        end

        def site_description
          @site_description ||= @site["description"]
        end

        # Page title without site title or description appended
        def page_title
          @page_title ||= @page["title"] || site_title
        end

        def site_tagline_or_description
          site_tagline || site_description
        end
      end
    end
  end
end
