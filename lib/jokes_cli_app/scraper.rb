class Scraper

  def self.scrape_category
    page = Nokogiri::HTML(open("http://jokes.cc.com/"))
    page.css("ul.list_horiz li").each do |category|

      binding.pry
    end
  end

end
