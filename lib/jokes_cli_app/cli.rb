class CLI

  def start
    puts "Welcome to Jokes for Fun!"
    Scraper.scrape_category
    menu
  end


  def menu
    input = ""

    until input == "exit"
      puts "Please, select a number for the Jokes category. However, if you can't take a joke, type exit please."
      jokes = Jokes.all#display categories of jokes to user
      jokes.each.with_index(1) do |cate, index|
        puts "#{index}. #{cate.title}"
      end


      input = gets.strip

      if input.to_i.between?(1, Jokes.all.size)
        index = input.to_i - 1
        category = Jokes.all[index]
        Scraper.scrape_category_details(category)
        display_details(category)
      else
        puts "See ya, wouldn't wanna be ya!"
      end
    end
  end



  def display_details(category)
  end

end
