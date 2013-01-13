class TributeScraper
  require 'nokogiri'
  require 'open-uri'

  def get_local_links_list
    File.read("current_links.txt").split(", ")
  end

  def get_links_from_tweets(url="https://twitter.com/search/realtime?q=%23PDFTribute&src=hash")
    links_to_return = []
    doc = Nokogiri::HTML(open(url))
    doc.css('a.twitter-timeline-link').each do |link|
      links_to_return << link
    end
    return links_to_return
  end

  def download_pdfs_from_link(link)
    return_values = []
    begin
      doc = Nokogiri::HTML(open(link.attributes["href"].value))
      pdf_links = doc.css("a[href*='.pdf']")
      pdf_links.each do |p_link|
        href_value = p_link.attributes["href"].value
        return_values << href_value if href_value.include?("http")
      end
    rescue
      nil
    end
    return return_values
  end

  def do_all
    get_links_from_tweets.each do |tweet_link|
      current_local_links = get_local_links_list
      pdf_links = download_pdfs_from_link(tweet_link)
      links_to_write = pdf_links - current_local_links
      unless links_to_write.empty?
        File.open("current_links.txt", "a") do |f|
          f.write(", ")
          f.write(links_to_write.join(", "))
        end
      end
      puts links_to_write.count
    end
    return nil
  end

end
