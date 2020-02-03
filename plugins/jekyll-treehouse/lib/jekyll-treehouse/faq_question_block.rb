# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FaqQuestionBlock < Liquid::Block

      def render(context)
        text = super
        "<p class='faq-question h3'>📍#{text}</p>"
      end

    end
  end
end
