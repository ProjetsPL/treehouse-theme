# frozen_string_literal: true

module Jekyll
  module Treehouse
    class FaqItemBlock < Liquid::Block

      def render(context)
        text = super
        "<section class='distinction distinction-question'>#{text}</section>"
      end

    end
  end
end
