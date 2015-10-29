class Article
  include Mongoid::Document

  field :name
  field :content
  field :date_of_article, type: Date

  belongs_to :user
end
