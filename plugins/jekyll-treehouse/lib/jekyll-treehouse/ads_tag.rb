# frozen_string_literal: true

module Jekyll
  module Treehouse
    module Ads
      def inject_ads(html)
        doc = Nokogiri::HTML::DocumentFragment.parse(html)
        ps = doc.search('p:nth-child(4n)')
        
        ps.each do |p|
          p.add_next_sibling('<ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" data-ad-client="ca-pub-2667869260064660" data-ad-slot="3963324455"></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script>')
        end

        doc.to_html
      end
    end
  end
end
