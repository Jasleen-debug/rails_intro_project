class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).all.order("average_listing DESC").page params[:page]
  end

  def show
    @book = Book.find(params[:id]).page params[:page]
  end

  def search
    word_search = "%#{params[:keywords]}"
    @books = Book.where("title LIKE?", word_search)
  end
end
