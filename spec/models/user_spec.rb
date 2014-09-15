require "omniauth"
require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  let!(:user_social) { create(:user_social) }

  describe "role change methods test" do
    describe "to_admin!" do
      it "should receive right method" do
        expect(user).to receive(:update_attributes).and_return(user)
        user.to_admin!
      end
      it "should change role to admin" do
        user.to_admin!
        expect(user.role).to eq("admin")
      end
    end

    describe "to_project_owner!" do
      it "should receive right method" do
        expect(user).to receive(:update_attributes).and_return(user)
        user.to_project_owner!
      end
      it "should change role to project_owner" do
        user.to_project_owner!
        expect(user.role).to eq("project_owner")
      end
    end

    describe "to_member!" do
      before { user.to_admin! }
      it "should receive right method" do
        expect(user).to receive(:update_attributes).and_return(user)
        user.to_member!
      end
      it "should change role to to_member" do
        user.to_member!
        expect(user.role).to eq("member")
      end
    end
  end
end
