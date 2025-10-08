require 'rails_helper'

RSpec.describe Genre, type: :model do
  before { FactoryBot.create(:genre) }
  describe 'associations' do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end