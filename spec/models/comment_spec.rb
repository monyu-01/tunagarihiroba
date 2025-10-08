require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:comment_body) }
    it { should validate_length_of(:comment_body).is_at_most(300) }
  end

  describe "associations" do
    it { should belong_to(:member) }
    it { should belong_to(:post) }
  end

  describe ".with_available_members" do
    let!(:available_member) { create(:member, user_status: :available) }
    let!(:suspended_member) { create(:member, user_status: :suspended) }
    let!(:comment_from_available) { create(:comment, member: available_member) }
    let!(:comment_from_suspended) { create(:comment, member: suspended_member) }
    
    it "availableなMemberに紐づくコメントだけを返す" do
      result = Comment.with_available_members
      expect(result).to include(comment_from_available)
      expect(result).not_to include(comment_from_suspended)
    end
  end
end
