class Author
#   An author is initialized with a name, as a string.
# A name cannot be changed after it is initialized.
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  # method to return the name of the author
  def name
    @name
  end

  # Returns an array of Article instances the author has written
  def articles
    Article.all.select{|article| article.author.name == self.name}
  end

  # Returns a unique array of Magazine instances for which the author has contributed to
  def magazines
    self.articles.map{ |article| article.magazine}.uniq
  end

  # Given a magazine (as Magazine instance) and a title (as a string), creates a new Article instance and associates it with that author and that magazine.
  def add_article(magazine,title)
    Article.new(self, magazine, title)
  end

  # Returns a unique array of strings with the categories of the magazines the author has contributed to
  def topic_areas
    self.magazines.collect { |magazine| magazine.category }.uniq  
  end
end
