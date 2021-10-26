class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher).all.order("average_listing DESC")
  end

  def show
    @book = Book.find(params[:id])
  end
end
