# frozen_string_literal: true

module Jekyll
  class TipBlock < Liquid::Block

    def render(context)
      text = super
      "<p class='tip'>#{text}</p>"
    end

  end
end
