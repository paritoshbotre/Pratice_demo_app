class ProductsController < ApplicationController
  before_action :authenticate_user!

  def import
    if params[:file].present?
      file = params[:file]
      job = ExampleJob.perform_later(params[:file].path, current_user.email)
      redirect_to products_path, notice: 'Products is being uploaded... You will receive email once it is uploaded successfully'
    end
  end

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

  def moving_file_to_new_location(file)
    file_path = file.path
    new_file_path = '/public/abc.xlsx'
    FileUtils.cp(file_path, Rails.root.join(new_file_path))
    File.open new_file_path
  end
end
