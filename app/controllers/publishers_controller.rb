class PublishersController < ApplicationController
  def index
    @publishers =
      Publisher.select("publishers.*")
               .select("COUNT(publishers.id)
		                  as book_count")
               .left_joins(:books)
               .group("publishers.id")
               .order("book_count DESC").page params[:page]
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
