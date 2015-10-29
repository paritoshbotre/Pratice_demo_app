module UserMethods
  extend ActiveSupport::Concern

  included do
    validates_presence_of :email, :password
    validates_uniqueness_of :email

    has_many :articles
  end
end
