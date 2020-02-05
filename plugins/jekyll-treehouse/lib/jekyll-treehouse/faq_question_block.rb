# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FaqQuestionBlock < Liquid::Block

      def render(context)
        text = super
        "<h3>📍#{text}</h3>"
      end

    end
  end
end
