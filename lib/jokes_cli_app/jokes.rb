class JokesCliApp::Jokes
  attr_accessor :link, :title

  @@all = []

  def initialize(title, link)
    @title = title
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end

end
