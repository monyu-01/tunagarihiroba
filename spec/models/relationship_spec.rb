require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'associations' do
    it { should belong_to(:follower).class_name('Member') }
    it { should belong_to(:followed).class_name('Member') }
  end

  describe 'validations' do
    subject { create(:relationship) } 
    it { should validate_uniqueness_of(:follower_id).scoped_to(:followed_id) }
  end
end