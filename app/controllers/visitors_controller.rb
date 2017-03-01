class VisitorsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort] == "alphabetical"
      @products = Product.alphabetical
    end
  end
end
