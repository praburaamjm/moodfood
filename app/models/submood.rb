class Submood
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :image_url, type: String
  embedded_in :mood, :inverse_of => :submoods
end
