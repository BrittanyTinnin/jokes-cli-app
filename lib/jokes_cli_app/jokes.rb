class Jokes
  attr_accessor :link, :title, :url

  @@all = []

  def initialize(title, link, url)
    @title = title
    @link = link
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end



end
