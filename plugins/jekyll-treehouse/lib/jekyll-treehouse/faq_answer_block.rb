# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FaqAnswerBlock < Liquid::Block

      def render(context)
        text = super
        "<p class='faq-answer'>#{text}</p>"
      end

    end
  end
end
