# frozen_string_literal: true

module Jekyll
  class FaqItemBlock < Liquid::Block

    def render(context)
      text = super
      "<div itemscope itemtype='http://schema.org/Question'>#{text}</div>"
    end

  end
end
