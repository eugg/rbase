require "rails_helper"

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  describe "active_model test" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :status }
    it { should validate_presence_of :post_type }
  end

  describe "active_record test" do
    it { should have_many :post_relations }
    it { should define_enum_for :status }
    it { should define_enum_for :post_type }
  end
end
