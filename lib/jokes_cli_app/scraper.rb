class Scraper

  def self.scrape_category
    page = Nokogiri::HTML(open("http://jokes.cc.com/"))
    page.css("div.middle ul li").each do |category|
      link = category.css("a").attribute("href").text
      title = category.css("a").text
      joke = Jokes.new(title, link)
      # binding.pry
    end
  end

  def self.scrape_category_details(category)
    page = Nokogiri::HTML(open("http://jokes.cc.com/"))

  end

end
