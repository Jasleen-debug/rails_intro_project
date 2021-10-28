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
    @authors = Author.limit(10)
  end

  def search
    if params["name"].blank?
      @books = Book.search(params[:keywords])
    else
      publisher = Publisher.find(params["id"]["name"])
      puts "Created #{publisher} Publishers."
      @books = publisher.books.search(params[:keywords])
    end
  end
end
