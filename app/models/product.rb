class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :sku,            type: String
  field :name,           type: String
  field :description
  field :long_description

  slug :sku

  default_scope -> {where(company_id: Company.current_id)}

  # associations
  #
  belongs_to :supplier 

  def to_param
    self.sku
  end

  def as_json(options = {})
    super(only: [:sku, :name, :description, :long_description, :_id], methods: [:supplier_name, :edit_product_path])
  end

  def edit_product_path
    Rails.application.routes.url_helpers.edit_product_path(self)
  end

  def supplier_name
    return self.supplier.name
  end

end
