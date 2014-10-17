require "rails_helper"

RSpec.describe PostRelation, type: :model do
  let(:post_relation) { create(:post_relation) }

  describe "active_model test" do
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :tag_id }
    it { should validate_presence_of :type }
  end

  describe "active_record test" do
    it { should belong_to :post }
    it { should belong_to :tag }
    it { should define_enum_for :type }
  end
end
