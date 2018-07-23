class JokesCliApp::Joke

  attr_accessor :title, :link, :content

  def initialize(title, link)
    @title = title
    @link = link
  end

end
