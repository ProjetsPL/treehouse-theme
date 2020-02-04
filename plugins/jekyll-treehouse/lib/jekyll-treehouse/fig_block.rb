# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FigBlock < Liquid::Block

      def render(context)
        text = super
        "<figure>#{Kramdown::Document.new(text).to_html}</figure>"
      end

    end
  end
end
