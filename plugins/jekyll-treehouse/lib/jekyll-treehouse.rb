# frozen_string_literal: true

require "jekyll"
require "jekyll/warning_block"
require "jekyll/tip_block"
require "jekyll/faq_item_block"
require "jekyll/faq_question_block"
require "jekyll/faq_answer_block"

module Jekyll
  module Treehouse

  end
end

Liquid::Template.register_tag('warning', Jekyll::WarningBlock)
Liquid::Template.register_tag('tip', Jekyll::TipBlock)
Liquid::Template.register_tag('faqItem', Jekyll::FaqItemBlock)
Liquid::Template.register_tag('faqQuestion', Jekyll::FaqQuestionBlock)
Liquid::Template.register_tag('faqAnswer', Jekyll::FaqAnswerBlock)
