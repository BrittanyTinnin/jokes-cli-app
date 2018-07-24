class JokesCliApp::Category

  attr_accessor :link, :title, :joke_list

  @@all = []

  def initialize(title, link)
    @title = title
    @link = link
    @joke_list = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_joke(joke)
    @joke_list << joke
  end

end
