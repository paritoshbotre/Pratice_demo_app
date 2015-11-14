class Movie
  include Mongoid::Document
  include Mongoid::Paperclip

  ####  searchkick for elasticsearh#####
  searchkick autocomplete: ['title']

  field :title, type: String
  field :description, type: String
  field :director, type: String
  field :avatar, type: String

  has_mongoid_attached_file :avatar, styles: { :medium => "300x150", :thumb => "325x475>"  }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :user
end
