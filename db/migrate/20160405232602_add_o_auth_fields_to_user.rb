class AddOAuthFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :display_name, :string
    add_column :users, :email, :string
    add_column :users, :bio, :string
    add_column :users, :links, :string
    add_column :users, :push_notifs, :boolean
    add_column :users, :email_notifs, :boolean
    add_column :users, :logo, :string
    add_column :users, :partnered, :boolean
    add_column :users, :user_type, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :twitch_url, :string
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
  end
end
