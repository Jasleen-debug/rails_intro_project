class BooksController < ApplicationController
  def index
    @books = Book.includes(:publisher,
                           :authors).all.order("average_listing DESC").page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @books = Book.search(params[:keywords])
  end
end
