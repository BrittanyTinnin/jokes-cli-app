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
      jokes = JokesCliApp::Jokes.all#display categories of jokes to user
      jokes.each.with_index(1) do |cate, index|
        puts "#{index}. #{cate.title}"
      end


      input = gets.strip

      if input.to_i.between?(1, JokesCliApp::Jokes.all.size)
        index = input.to_i - 1
        category = JokesCliApp::Jokes.all[index]
        #how do I use method below to select/display the new list of category
        #once that is listed, select the cate and read the joke
        JokesCliApp::Scraper.scrape_subcategory(category)
        JokesCliApp::Scraper.scrape_subcat_details(category)
        display_details(category)
      else
        puts "See ya, wouldn't wanna be ya!"
      end
    end
  end



  def display_details(category)
  end

end
