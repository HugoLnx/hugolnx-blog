class AddNicknameAndAvatarPathToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nickname, :string
    add_column :users, :avatar_path, :string
  end

  def self.down
    remove_column :users, :avatar_path
    remove_column :users, :nickname
  end
end
