class Supplier
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :start_date
  field :end_date
  field :status
  field :reason

  has_many :products
end
