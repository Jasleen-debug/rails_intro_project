class HomeController < ApplicationController
  def index
    @books = Book.includes(:publisher)
                 .order("num_pages ASC")
                 .limit(10)

    @publishers = Publisher.select("publishers.*")
                           .select("COUNT(publishers.id) as book_count")
                           .left_joins(:books)
                           .group("publishers.id")
                           .order("book_count DESC")
                           .limit(10)
  end
end
