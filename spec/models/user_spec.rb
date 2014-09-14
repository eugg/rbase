require "rails_helper"

RSpec.describe User, type: :model do

  describe "create_user_social method test" do
    before do
      subject.create_user_social()
    end
    
    it "should search user by uid & provider" do
      expect(User).to receive_message_chain(:joins, :where, :empty?)
    end
  end
end
