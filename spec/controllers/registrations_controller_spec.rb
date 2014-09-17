require "rails_helper"
RSpec.describe Users::RegistrationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user_social) { create(:user_social, user_id: user.id) }
end
