class JokesCliApp::Scraper

  def self.scrape_category
    page = Nokogiri::HTML(open("http://jokes.cc.com/"))
    page.css("div.middle ul li").each do |category|
      link = category.css("a").attribute("href").text
      title = category.css("a").text
      joke = JokesCliApp::Jokes.new(title, link)
    end
  end

  def self.scrape_subcategory(category)
    page_two = Nokogiri::HTML(open(category.link))
    page_two.css("div.module_content .middle ul li").each do |item|
      title = item.css("h3").text
      link = item.css("a").attribute("href").text
      sub_joke = JokesCliApp::Jokes.new(title, link)
      # binding.pry
    end
  end

  def self.scrape_subcat_details(category)

  end
end
