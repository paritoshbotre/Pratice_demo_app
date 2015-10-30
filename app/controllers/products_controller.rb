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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product Updated !!'
      redirect_to products_path, turbolinks: false
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :sku, :long_description, :description, :supplier_id)
  end
end
