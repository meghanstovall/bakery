require "rails_helper"

RSpec.describe Baker, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end
  
  describe 'relationships' do
    it { should have_many :recipes }
  end
end
