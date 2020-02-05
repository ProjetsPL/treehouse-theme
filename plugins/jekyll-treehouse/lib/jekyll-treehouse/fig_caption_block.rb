# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FigCaptionBlock < Liquid::Block

      def render(context)
        text = super
        "<figcaption>#{text}</figcaption>"
      end

    end
  end
end
