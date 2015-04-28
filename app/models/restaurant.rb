class Restaurant
  include Mongoid::Document
  field :name, type: String
  field :content, type: Text
  field :image_url, type: String
  field :location, type: String
end
