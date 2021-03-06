require "rails_helper"

RSpec.describe Tag, type: :model do
  let(:tag) { create(:tag) }

  describe "active_model test" do
    it { should validate_presence_of :name_zh }
    it { should validate_presence_of :name_en }
    it { should validate_presence_of :tag_type }
  end

  describe "active_record test" do
    it { should have_many(:posts).through(:post_relations) }
    it { should have_many :post_relations }
    it { should define_enum_for :tag_type }
  end
end
