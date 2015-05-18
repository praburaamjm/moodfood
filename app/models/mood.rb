class Mood
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :image_url, type: String
  embeds_many :submoods

end
