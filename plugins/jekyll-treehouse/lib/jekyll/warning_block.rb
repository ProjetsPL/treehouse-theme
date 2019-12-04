# frozen_string_literal: true

require "kramdown"
require 'sanitize'

module Jekyll
  class WarningBlock < Liquid::Block

    def render(context)
      text = super

      html = Kramdown::Document.new(text).to_html
      output = Sanitize.fragment(html, elements:['strong', 'b', 'i', 'em'])

      "<p class='warning'>#{html}</p>"
    end

  end
end
