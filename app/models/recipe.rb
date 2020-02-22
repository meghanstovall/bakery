class Recipe < ApplicationRecord
  validates_presence_of :name, :number_ingredients, :bake_time, :oven_temp
  belongs_to :baker
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
