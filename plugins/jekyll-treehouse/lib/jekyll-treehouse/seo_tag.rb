# frozen_string_literal: true

require 'jekyll-treehouse/seo/title_service'
require 'jekyll-treehouse/seo/description_service'
require 'jekyll-treehouse/seo/canonical_service'
require 'jekyll-treehouse/seo/json_ld_service'
require 'jekyll-treehouse/seo/filters'

module Jekyll
  module Treehouse
    class SeoTag < Liquid::Tag

       def initialize(tag_name, text, tokens)
         super
         @text = text
       end

       def render(context)
        title = Seo::TitleService.call(context: context).result
        description = Seo::DescriptionService.call(context: context).result
        canonical = Seo::CanonicalService.call(context: context).result
        json_ld = Seo::JsonLdService.call(context: context).result

        [
          title,
          description,
          canonical,
          json_ld
        ].join
       end
     end
  end
end
