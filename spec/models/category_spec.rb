require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe "active_model test" do
    it { should validate_presence_of :name_zh }
    it { should validate_presence_of :name_en }
  end
end
