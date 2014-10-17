require "rails_helper"

RSpec.describe Tag, type: :model do
  let(:tag) { create(:tag) }

  describe "active_model test" do
    it { should validate_presence_of :name_zh }
    it { should validate_presence_of :name_en }
  end

  describe "active_record test" do
    it { should have_many :post_relations }
  end
end
