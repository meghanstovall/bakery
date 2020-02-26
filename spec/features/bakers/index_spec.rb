require 'rails_helper'

RSpec.describe 'bakers index' do
  before(:each) do
    @shane = Baker.create(name: "Shane")
    @nini = Baker.create(name: "Nini")
    @zach = Baker.create(name: "Zach")

    visit '/bakers'
  end

  it "can see name of all bakers" do
    expect(page).to have_content("All Bakers")

    within "#baker-#{@shane.id}" do
      expect(page).to have_content(@shane.name)
    end

    within "#baker-#{@nini.id}" do
      expect(page).to have_content(@nini.name)
    end

    within "#baker-#{@zach.id}" do
      expect(page).to have_content(@zach.name)
    end
  end

  it "can click on a baker and sent to that bakers show page" do
    within "#baker-#{@shane.id}" do
      expect(page).to have_link(@shane.name)
    end

    within "#baker-#{@nini.id}" do
      expect(page).to have_link(@nini.name)
    end

    within "#baker-#{@zach.id}" do
      click_link @zach.name
      expect(current_path).to eq("/bakers/#{@zach.id}")
    end
  end
end
