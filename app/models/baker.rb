class Baker < ApplicationRecord
  validates_presence_of :name
  has_many :recipes
end
