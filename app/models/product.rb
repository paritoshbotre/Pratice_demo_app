class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :sku
  field :name
  field :description
  field :long_description

  belongs_to :supplier 

  def as_json(options = {})
    super(only: [:sku, :name, :description, :long_description], methods: [:supplier_name])
  end

  def supplier_name
    return self.supplier.name
  end

end
