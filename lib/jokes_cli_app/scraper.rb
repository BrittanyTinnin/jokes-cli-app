class JokesCliApp::Scraper

  def self.scrape_category
    page = Nokogiri::HTML(open("http://jokes.cc.com/"))
    page.css("div.middle ul li").each do |category|
      link = category.css("a").attribute("href").text
      title = category.css("a").text
      joke = JokesCliApp::Category.new(title, link)
    end
  end

  def self.scrape_subcategory(category_object)
    collection = []
    page_two = Nokogiri::HTML(open(category_object.link))
    page_two.css("div.module_content .middle ul li a")[0..9].each do |joke_doc|
      title = joke_doc.text
      link = joke_doc.attribute("href").value
      joke_obj = JokesCliApp::Joke.new(title, link)

      category_object.add_joke(joke_obj)
    end
  end
  # def self.scrape_subcat_details(category)
  #
  # end
end
