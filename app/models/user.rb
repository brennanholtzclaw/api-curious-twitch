class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    # binding.pry
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.display_name       = auth_info.extra.raw_info.display_name
      new_user.email              = auth_info.extra.raw_info.email
      new_user.bio                = auth_info.extra.raw_info.bio
      new_user.links              = auth_info.extra.raw_info._links.self
      new_user.logo               = auth_info.extra.raw_info.logo
      new_user.push_notifs        = auth_info.extra.raw_info.notifications.push
      new_user.email_notifs       = auth_info.extra.raw_info.notifications.email
      new_user.partnered          = auth_info.extra.raw_info.partnered
      new_user.user_type          = auth_info.extra.raw_info.type
      new_user.nickname           = auth_info.info.nickname
      new_user.image              = auth_info.info.image
      new_user.twitch_url         = auth_info.info.urls["Twitch"]
      new_user.provider           = auth_info.provider
      new_user.oauth_token        = auth_info.credentials.token
    end
  end
end
