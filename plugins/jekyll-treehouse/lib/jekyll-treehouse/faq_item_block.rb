# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FaqItemBlock < Liquid::Block

      def render(context)
        text = super
        "<div class='faq-item'>#{text}</div>"
      end

    end
  end
end
