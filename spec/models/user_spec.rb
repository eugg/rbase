require "omniauth"
require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  let!(:user_social) { create(:user_social) }
end
