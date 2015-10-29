supplier1 = Supplier.find_or_create_by(name: 'ABC Supplier')
supplier2 = Supplier.find_or_create_by(name: 'Xyz Supplier')

Product.find_or_create_by(sku: "sku1", name: 'Product1', description: 'some description', long_description: 'long description', supplier_id: supplier1.id)
Product.find_or_create_by(sku: "sku2", name: 'Product2', description: 'some description 2', long_description: 'long description 2', supplier_id: supplier2.id)

user = User.create!({:email => "paritosh@gmail.com", :role => "admin", :password => "josh123", :password_confirmation => "josh123" })
user = User.create!({:email => "test1@gmail.com", :role => "agent", :password => "josh123", :password_confirmation => "josh123" })
