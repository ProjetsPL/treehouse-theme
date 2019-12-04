# frozen_string_literal: true

module Jekyll
  class FaqItemBlock < Liquid::Block

    def render(context)
      text = super
      "<div itemscope itemprop='mainEntity' itemtype='https://schema.org/'>#{text}</div>"
    end

  end
end
