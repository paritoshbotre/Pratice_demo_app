class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :subdomain

  #scope
  scope :find_by_subdomain!, -> requested_subdomain { where(subdomain: requested_subdomain) }

  #methods
  def self.current_id=(id)
    Thread.current[:company_id] = id
  end

  def self.current_id
    Thread.current[:company_id]
  end
end
