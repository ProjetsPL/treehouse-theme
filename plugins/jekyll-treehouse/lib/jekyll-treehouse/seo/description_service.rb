# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      class DescriptionService < Service
        attributes :context

        def call
          @site = context['site']
          @page = context['page']

          description = @page["description"] || @page["excerpt"] || @site["description"]
          description.gsub!("\n", '')

          ['<meta name="description" content="', description, '" />'].join
        end

        private

      end
    end
  end
end
