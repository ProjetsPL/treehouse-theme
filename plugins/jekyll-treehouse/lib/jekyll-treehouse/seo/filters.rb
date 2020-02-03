# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Seo
      class Filters
        include Jekyll::Filters
        include Liquid::StandardFilters

        def initialize(context)
          @context = context
        end
      end
    end
  end
end
