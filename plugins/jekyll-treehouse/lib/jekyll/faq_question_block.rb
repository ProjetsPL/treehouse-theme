# frozen_string_literal: true

module Jekyll
  class FaqQuestionBlock < Liquid::Block

    def render(context)
      text = super
      "<h2 itemprop='name'>#{text}</h2>"
    end

  end
end
