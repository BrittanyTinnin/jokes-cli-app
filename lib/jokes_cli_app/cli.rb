class JokesCliApp::CLI

  def start
    puts "Welcome to Jokes for Fun!"
    puts ""
    puts "Why so serious!? Let's put a smile on that face!"
    JokesCliApp::Scraper.scrape_category
    menu
  end


  def menu
    input = ""

    until input == "exit"
      puts ""
      puts "Please select a number for the Jokes category."
      puts "But...if you can't take a joke, type exit please."
      puts ""
      jokes = JokesCliApp::Category.all
      jokes.each.with_index(1) do |cate, index|
        puts "#{index}. #{cate.title}"
      end

      input = gets.strip

      if input.to_i.between?(1, JokesCliApp::Category.all.size)
        index = input.to_i - 1
        category_details = JokesCliApp::Category.all[index]
        JokesCliApp::Scraper.scrape_subcategory(category_details)
        display_details(category_details)
      elsif input == "exit"
        puts ""
        puts "Aww...too bad :("
        puts "See ya, wouldn't wanna be ya!"
      else
        puts "That's not quite right... try again."
        puts ""
      end
    end
  end


  def display_details(category_details)
    puts ""
    category_details.joke_list.each.with_index(1) do |joke, index|
      puts "#{index}. #{joke.title}"
    end
    puts ""
    puts "Please enter a number for a joke, and watch that frown turn upside down!"

    input = gets.strip
    index = input.to_i - 1

    joke = category_details.joke_list[index]
    # binding.pry
    # call on the scraper to scrape the content for that individual joke
    puts ""
    JokesCliApp::Scraper.scrape_joke_content(joke)
    puts ""

    puts "#{joke.content}"

    puts ""

    puts "Would you like to laugh again? yes or exit"
    input = gets.strip
    if input == "yes"
      menu
    elsif input == "exit"
      menu
    else
      puts "That's not quite right... try again"
      puts ""
    end
  end

end
