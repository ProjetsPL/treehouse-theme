# frozen_string_literal: true

require "pry"
require "jekyll"
require "jekyll-treehouse/service"
require "jekyll-treehouse/faq_item_block"
require "jekyll-treehouse/faq_question_block"
require "jekyll-treehouse/faq_answer_block"
require "jekyll-treehouse/fig_block"
require "jekyll-treehouse/fig_caption_block"
require "jekyll-treehouse/seo_tag"

module Jekyll
  module Treehouse

  end
end

Liquid::Template.register_tag('faqItem', Jekyll::Treehouse::FaqItemBlock)
Liquid::Template.register_tag('faqQuestion', Jekyll::Treehouse::FaqQuestionBlock)
Liquid::Template.register_tag('faqAnswer', Jekyll::Treehouse::FaqAnswerBlock)

Liquid::Template.register_tag('fig', Jekyll::Treehouse::FigBlock)
Liquid::Template.register_tag('figCaption', Jekyll::Treehouse::FigCaptionBlock)

Liquid::Template.register_tag('treehouseseo', Jekyll::Treehouse::SeoTag)
