require 'rails_helper'

RSpec.describe 'bakers show' do
  before(:each) do
    @shane = Baker.create(name: "Shane")
    @nini = Baker.create(name: "Nini")
    @zach = Baker.create(name: "Zach")
    @pasta = @shane.recipes.create!(name: "Pasta", number_ingredients: 3, bake_time: 10, oven_temp: 350)
    @pizza = @shane.recipes.create!(name: "Pizza", number_ingredients: 15, bake_time: 30, oven_temp: 425)
    @meatloaf = @shane.recipes.create!(name: "Meatloaf", number_ingredients: 5, bake_time: 40, oven_temp: 450)

    visit '/bakers'
  end

  it "can see baker and its recipes" do
    within "#baker-#{@shane.id}" do
      click_link "#{@shane.name}"
    end
    expect(current_path).to eq("/bakers/#{@shane.id}")
    expect(page).to have_content(@shane.name)
    expect(page).to have_content(@pasta.name)
    expect(page).to have_content(@pizza.name)
    expect(page).to have_content(@meatloaf.name)
  end
end
