class CLI

  def initialize(name)
    @name = name
  end

  def start
    puts "Welcome to Jokes for Fun!"
    puts "Please select a category for Jokes."
    Scraper.scrape_category
    #display categories of jokes to user
  end

end
