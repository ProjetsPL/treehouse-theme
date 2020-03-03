# frozen_string_literal: true

require 'jekyll-treehouse/seo/json_ld/organization_service'
require 'jekyll-treehouse/seo/json_ld/website_service'
require 'jekyll-treehouse/seo/json_ld/collection_service'
require 'jekyll-treehouse/seo/json_ld/webpage_service'
require 'jekyll-treehouse/seo/json_ld/image_service'
require 'jekyll-treehouse/seo/json_ld/breadcrumb_service'
require 'jekyll-treehouse/seo/json_ld/article_service'
require 'jekyll-treehouse/seo/json_ld/person_service'
require 'jekyll-treehouse/seo/json_ld/faq_service'

module Jekyll
  module Treehouse
    module Seo
      class JsonLdService < Service
        attributes :context

        def call
          schema = "https://schema.org"

          graph = []
          graph << JsonLd::OrganizationService.call(context: context).result
          graph << JsonLd::WebsiteService.call(context: context).result

          if context['page']['layout'] == 'blog'
            graph << JsonLd::CollectionService.call(context: context).result
          elsif ['post', 'ranking', 'ranking-hub'].include? context['page']['layout']
            graph << JsonLd::ImageService.call(context: context).result
            graph << JsonLd::WebpageService.call(context: context).result
            # graph << JsonLd::BreadcrumbService.call(context: context).result
            graph << JsonLd::ArticleService.call(context: context).result
            graph << JsonLd::PersonService.call(context: context).result
            graph += JsonLd::FaqService.call(context: context).result
          end

          json = {
            "@context": schema,
            "@graph": graph
          }.to_json

          ['<script type="application/ld+json">', json, '</script>'].join
        end
      end
    end
  end
end
