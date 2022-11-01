require_relative "./author.rb"
require_relative "./magazine.rb"

class Article
#     An article is initialized with an author as an Author object, a magazine as a Magazine object, and title as a string.
# An article cannot change its author, magazine, or title after it is has been initialized.
    attr_reader :author, :magazine, :title 

    @@all = []
    
    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end

    # Returns the title for that given article
    def title
        @title
    end

    # Returns an array of all Article instances
    def self.all
        @@all
    end

    # Returns the author for that given article
    def author
        @author
    end

    # Returns the magazine for that given article
    def magazine
        @magazine
    end
end


