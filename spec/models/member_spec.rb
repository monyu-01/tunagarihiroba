require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user_status) }
    it { should validate_presence_of(:name).on(:update_profile) }
    it { should validate_length_of(:name).is_at_most(15).on(:update_profile) }
    it { should validate_length_of(:self_introduction).is_at_most(500).on(:update_profile) }
  end

  describe "enum" do
    it { should define_enum_for(:user_status).with_values([:available, :suspended]) }
  end

  describe "associations" do
    it { should have_one_attached(:profile_image) }
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:saved_posts).dependent(:destroy) }
    it { should have_many(:saved_posts_posts).through(:saved_posts).source(:post) }
    it { should have_many(:active_relationships).class_name("Relationship").with_foreign_key("follower_id").dependent(:destroy) }
    it { should have_many(:passive_relationships).class_name("Relationship").with_foreign_key("followed_id").dependent(:destroy) }
    it { should have_many(:followings).through(:active_relationships).source(:followed) }
    it { should have_many(:followers).through(:passive_relationships).source(:follower) }
    it { should have_many(:followed_posts).through(:followings).source(:posts) }
    it { should have_many(:active_notifications).class_name("Notification").with_foreign_key("visitor_id").dependent(:destroy) }
    it { should have_many(:passive_notifications).class_name("Notification").with_foreign_key("visited_id").dependent(:destroy) }
    it { should have_many(:reports_made).class_name("Report").with_foreign_key("reporter_id").dependent(:destroy) }
    it { should have_many(:reports_received).class_name("Report").with_foreign_key("reported_id").dependent(:destroy) }
  end

  describe "scope" do
    let!(:available_member) { create(:member, user_status: :available) }
    let!(:suspended_member) { create(:member, user_status: :suspended) }

    describe ".available" do
      it "user_statusがavailableのメンバーだけを返す" do
        result = Member.available
        expect(result).to include(available_member)
        expect(result).not_to include(suspended_member)
      end
    end
  end
end