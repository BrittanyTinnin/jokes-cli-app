class CLI

  def start
    puts "Welcome to Jokes for Fun!"
    puts "Please select a category for Jokes."
    Scraper.scrape_category
    jokes = Jokes.all#display categories of jokes to user
    jokes.each.with_index(1) do |cate, index|
      puts "#{index}. #{cate.title}"
    end

    input = gets.strip
    index = input.to_i - 1

    category = Jokes.all[index]

    display_details(category)
  end

  def display_details(category)
    Scraper.scrape_category_details(category)
  end

end
