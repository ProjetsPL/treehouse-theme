# frozen_string_literal: true

require "jekyll"
require "jekyll/warning_block"

module Jekyll
  module Treehouse

  end
end

Liquid::Template.register_tag('warning', Jekyll::WarningBlock)
