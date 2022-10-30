require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

DailyNation = Magazine.new("DailyNation", "News")
Nairobians = Magazine.new("Nairobians","Trends")
article1 = Article.new("WaliBora", "Nation", "leadership")
article2 = Article.new("Margret Agola", "Nairobians", "culture")
author1 = Author.new("Ken WaliBora")
author2 = Author.new("Margret Agola")





### DO NOT REMOVE THISora
binding.pry

0
