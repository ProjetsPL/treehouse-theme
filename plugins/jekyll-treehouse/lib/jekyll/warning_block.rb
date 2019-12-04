# frozen_string_literal: true

module Jekyll
  class WarningBlock < Liquid::Block

    def render(context)
      text = super
      "<p class='warning'>#{text}</p>"
    end

  end
end
