require 'rss'
require 'open-uri'
require 'httparty'
require 'jekyll'
require 'feedjira'

module ExternalPosts
  class ExternalPostsGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      if site.config['external_sources']
        site.config['external_sources'].each do |src|
          fetch_and_process_feed(src, site)
          sleep(1) if src['rss_url'].include?('dev.to') # Only sleep for dev.to feeds
        end
      end
    end

    private

    def fetch_and_process_feed(src, site)
      puts "Fetching external posts from #{src['name']}:"
      
      user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
      headers = {
        "User-Agent" => user_agent,
        "Accept" => "application/rss+xml, application/xml;q=0.9, text/xml;q=0.8, */*;q=0.7",
        "Accept-Language" => "en-US,en;q=0.5",
        "Accept-Encoding" => "gzip, deflate, br",
        "Connection" => "keep-alive"
      }

      begin
        response = HTTParty.get(src['rss_url'], headers: headers)
        if response.code == 200
          feed = RSS::Parser.parse(response.body, false)
            if feed.nil?
              xml = HTTParty.get(src['rss_url']).body 
              feed = Feedjira.parse(xml)
              if feed.nil?
                  puts "Error: Unable to parse feed from #{src['name']}"
              else
                  process_feed_enteries(feed, src, site)
              end
            else
                process_feed_items(feed, src, site)
            end
        else
          puts "Error: Received status code #{response.code} for #{src['name']}"
        end
      rescue => e
        puts "Error processing feed from #{src['name']}: #{e.message}"
      end
    end

    def process_feed_items(feed, src, site)
        feed.items.each do |item|
            puts "...fetching #{item.link}"
            slug = item.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
            path = site.in_source_dir("_posts/#{slug}.md")
            doc = Jekyll::Document.new(
            path, 
            { site: site, collection: site.collections['posts'] }
            )
            doc.data['external_source'] = src['name']
            doc.data['feed_content'] = item.description
            doc.data['title'] = item.title
            doc.data['description'] = item.description
            doc.data['date'] = item.pubDate
            doc.data['redirect'] = item.link
            site.collections['posts'].docs << doc
        end
    end
    def process_feed_enteries(feed, src, site)
      feed.entries.each do |e|
        p "...fetching #{e.url}"
        slug = e.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        path = site.in_source_dir("_posts/#{slug}.md")
        doc = Jekyll::Document.new(
          path, { :site => site, :collection => site.collections['posts'] }
        )
        doc.data['external_source'] = src['name'];
        doc.data['feed_content'] = e.content;
        doc.data['title'] = "#{e.title}";
        doc.data['description'] = e.summary;
        doc.data['date'] = e.published;
        doc.data['redirect'] = e.url;
        site.collections['posts'].docs << doc
      end
    end
  end
end