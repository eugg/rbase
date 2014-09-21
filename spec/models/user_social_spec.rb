require "rails_helper"

RSpec.describe UserSocial, type: :model do
  
  subject { create(:user_social) }

  describe "validation test" do
    it { should validate_presence_of :provider }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :token }
  end
end
