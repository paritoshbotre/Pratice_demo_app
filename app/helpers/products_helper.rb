module ProductsHelper

  def get_supplier
    Supplier.all.map { |supplier| [supplier.name, supplier.id] } 
  end
end
