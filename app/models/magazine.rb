class Magazine
#   A magazine is initialized with a name as a string and a category as a string
# The name and category of the magazine can be changed after being initialized.
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  # Returns an array of all Magazine instances
  def self.all
    @@all
  end

  # Returns an array of Author instances who have written for this magazine
  def contributors
    self.articles.map {|article| article.author}.uniq
  end

  # Given a string of magazine's name, this method returns the first magazine object that matches
  def self.find_by_name(name)
    self.all.find {|magazine| magazine.name == name}
  end

  # Returns an array strings of the titles of all articles written for that magazine
  def article_titles
    self.articles.map{|article| article.title}
  end

  # Returns an array of authors who have written more than 2 articles for the magazine
  def contributing_authors
    highest_contributor_author = Article.all.filter { |article| article.magazine.name == @name }.map {
      |article|
      article.author.name
    }.tally.each { |key, value| value > 2 }
    highest_contributor_author
  end
end
