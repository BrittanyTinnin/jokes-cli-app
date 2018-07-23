class JokesCliApp::CLI

  def start
    puts "Loading...."
    puts "Welcome to Jokes for Fun!"
    JokesCliApp::Scraper.scrape_category
    menu

  end


  def menu
    input = ""

    until input == "exit"
      puts "Please, select a number for the Jokes category. However, if you can't take a joke, type exit please."
      jokes = JokesCliApp::Category.all
      jokes.each.with_index(1) do |cate, index|
        puts "#{index}. #{cate.title}"
      end


      input = gets.strip

      if input.to_i.between?(1, JokesCliApp::Category.all.size)
        index = input.to_i - 1
        category_details = JokesCliApp::Category.all[index]
        #how do I use method below to select/display the new list of category
        #once that is listed, select the cate and read the joke
        JokesCliApp::Scraper.scrape_subcategory(category_details)
        # JokesCliApp::Scraper.scrape_subcat_details(category)
        display_details(category_details)

      else
        puts "See ya, wouldn't wanna be ya!"
      end
    end
  end


  def display_details(category_details)
    # binding.pry
    puts ""
    category_details.joke_list.each.with_index(1) do |joke, index|
      puts "#{index}. #{joke.title}"
    end

    puts "Please enter a number for a joke to see the content"

    input = gets.strip
    index = input.to_i - 1

    joke = category_details.joke_list[index]
    # call on the scraper to scrape the content for that individual joke
    Scraper.scrape_joke_content(joke)
  end


end
