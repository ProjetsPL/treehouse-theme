# frozen_string_literal: true

module Jekyll
  class FaqQuestionBlock < Liquid::Block

    def render(context)
      text = super
      "<h3 itemprop='name'>#{text}</h3>"
    end

  end
end
