class ProductsController < ApplicationController

  def index
    offset_val = params[:offset] || 0
    limit_val = params[:limit] || 25
    @products = Product.all.limit(limit_val).offset(offset_val)

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end
end
