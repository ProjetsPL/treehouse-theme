# frozen_string_literal: true

module Jekyll
  class FaqAnswerBlock < Liquid::Block

    def render(context)
      text = super
      "<div itemscope itemprop='acceptedAnswer' itemtype='https://schema.org/Answer'><div itemprop='text'>#{text}</div></div>"
    end

  end
end
