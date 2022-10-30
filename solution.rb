# Please copy/paste all three classes into this file to submit your solution!
# initial commit
# solution

#### Author

# - `Author#initialize(name)`
#   - An author is initialized with a name, as a string.
#   - A name **cannot** be changed after it is initialized.
# - `Author#name`
#   - Returns the name of the author

class Author 
    attr_reader :name

    def initialize (name)
        @name = name        
    end

    def name
        return @name
    end

    def articles
        Article.all.filter do |article|
        article.author.name == self.name
        end
    end
  
    def magazines
        self.articles.collect do |article|
        article.magazine
        end.uniq
    end

    def add_article(title, magazine)
        Article.new(title, magazine, self)
    end

    def topic_areas
        self.magazines.collect do |magazine|
        magazine.category
        end.uniq
    end
end

#### Magazine

# - `Magazine#initialize(name, category)`
#   - A magazine is initialized with a name as a string and a category as a string
#   - The name and category of the magazine **can be** changed after being initialized.
# - `Magazine#name`
#   - Returns the name of this magazine
# - `Magazine#category`
#   - Returns the category of this magazine
# - `Magazine.all`
#   - Returns an array of all Magazine instances

class Magazine
    attr_accessor :name, :category
    @@all = []

    def initialize(name, category)
        @name = name
        @category = category
        @@all << self
    end

    def name
        return @name
    end

    def category
        
    end

    def self.all
        return @@all
    end

    # - `Magazine#contributors`
    # - Returns an array of Author instances who have written for this magazine
    def contributors
        Article.all.filter do |article|
          article.magazine.name == self.name && article.magazine.category == self.category
        end.collect do |article|
          article.author
        end
        end
    end

#     - `Magazine.find_by_name(name)`
#   - Given a string of magazine's name, this method returns the first magazine object that matches
    def self.find_by_name(name)
        self.all.find do |magazine|
          magazine.name == name
        end
    end

#     - `Magazine#article_titles`
#   - Returns an array strings of the titles of all articles written for that magazine
    def article_titles
        Article.all.filter do |article|
        article.magazine.name == self.name && article.magazine.category == self.category
        end.collect do |article|
        article.title
        end
    end

#     - `Magazine#contributing_authors`
#   - Returns an array of authors who have written more than 2 articles for the magazine
    def contributing_authors
        self.contributors.filter {|author|author.articles.count > 2}
    end 

#### Article

# - `Article#initialize(author, magazine, title)`
#   - An article is initialized with an author as an Author object, a magazine as a Magazine object, and title as a string.
#   - An article **cannot** change its author, magazine, or title after it is has been initialized.
# - `Article#title`
#   - Returns the title for that given article
# - `Article.all`
#   - Returns an array of all Article instances

class Article

    attr_accessor :author, :magazine, :title 

    @@all = []

    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self        
    end

    def title
        return @title
    end

    def self.all
        return @@all
    end

    def author_name
        self.author.name
    end
    
    def magazine_name
        self.magazine.name
    end
end