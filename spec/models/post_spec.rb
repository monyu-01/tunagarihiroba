require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(30) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(1000) }
  end

  describe "associations" do
    it { should belong_to(:member) }
    it { should belong_to(:genre).optional }
    it { should have_one_attached(:image) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:saved_posts).dependent(:destroy) }
    it { should have_many(:notifications).dependent(:destroy) }
  end

  describe ".with_available_members_for_list" do
    let!(:available_member) { create(:member, user_status: :available) }
    let!(:suspended_member) { create(:member, user_status: :suspended) }
    let!(:post_from_available) { create(:post, member: available_member) }
    let!(:post_from_suspended) { create(:post, member: suspended_member) }

    it "availableなMemberに紐づく投稿だけを返す" do
      result = Post.with_available_members_for_list
      expect(result).to include(post_from_available)
      expect(result).not_to include(post_from_suspended)
    end
  end
end