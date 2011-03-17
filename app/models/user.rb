class User < ActiveRecord::Base
  has_many :comments

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.nickname = auth["user_info"]["nickname"]
      user.avatar_path  = auth["user_info"]["image"]
    end
  end
end
