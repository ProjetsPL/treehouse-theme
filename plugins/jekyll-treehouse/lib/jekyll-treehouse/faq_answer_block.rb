# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FaqAnswerBlock < Liquid::Block

      def render(context)
        text = super
        "<div class='faq-answer'>#{text}</div>"
      end

    end
  end
end
