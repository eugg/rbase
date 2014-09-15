
def facebook_hash
  {
    "provider" => "facebook",
    "uid" => "123545",
    "info" => {
      "first_name" => "Stan",
      "last_name" => "Luo",
      "name" => "Stan Luo",
      "email" => "test@example.com",
      "avatar" => "http://www.example.com"
    },
    "credentials" => {
      "token" => "123456",
      "expires_at" => Time.now + 1.week
    },
    "extra" => {
      "raw_info" => {
        "gender" => "male"
      }
    }
  }
end

def google_oauth2_hash
  {
    "provider" => "google_oauth2",
    "uid" => "123545",
    "info" => {
      "first_name" => "Stan",
      "last_name" => "Luo",
      "name" => "Stan Luo",
      "email" => "test@example.com",
      "avatar" => "http://www.example.com"
    },
    "credentials" => {
      "token" => "123456",
      "expires_at" => Time.now + 1.week
    },
    "extra" => {
      "raw_info" => {
        "gender" => "male"
      }
    }
  }
end

def weibo_hash
  {
    "provider" => "weibo",
    "uid" => "123545",
    "info" => {
      "first_name" => "Stan",
      "last_name" => "Luo",
      "name" => "Stan Luo",
      "email" => "test@example.com",
      "avatar" => "http://www.example.com"
    },
    "credentials" => {
      "token" => "123456",
      "expires_at" => Time.now + 1.week
    },
    "extra" => {
      "raw_info" => {
        "gender" => "m"
      }
    }
  }
end
