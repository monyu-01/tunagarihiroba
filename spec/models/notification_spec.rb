require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'associations' do
    it { should belong_to(:visitor).class_name('Member').optional }
    it { should belong_to(:visited).class_name('Member').optional } 
    it { should belong_to(:post).optional }
    it { should belong_to(:comment).optional }
  end
end