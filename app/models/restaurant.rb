class Restaurant
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :image_url, type: String
  field :location, type: String
end
