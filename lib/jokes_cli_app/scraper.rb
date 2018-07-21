class Scraper

  def self.scrape_category
    page = Nokogiri::HTML(open("http://jokes.cc.com/"))
    page.css("div.middle ul li").each do |category|
      link = category.css("a").attribute("href").text
      title = category.css("a").text
      binding.pry
    end
  end

end
