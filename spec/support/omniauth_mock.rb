
OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new
({
  provider: "facebook",
  uid: "123545",
  info: {
    first_name: "Stan",
    last_name: "Luo",
    name: "Stan Luo",
    email: "test@example.com",
    avatar: "http://www.example.com"
  },
  credentials: {
    token: "123456",
    expires_at: Time.now + 1.week
  },
  extra: {
    raw_info: {
      gender: "male"
    }
  }
})

OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new
({
  provider: "google",
  uid: "123545",
  info: {
    first_name: "Stan",
    last_name: "Luo",
    name: "Stan Luo",
    email: "test@example.com",
    image: "http://www.example.com"
  },
  credentials: {
    token: "123456",
    expires_at: Time.now + 1.week
  },
  extra: {
    raw_info: {
      gender: "male"
    }
  }
})
