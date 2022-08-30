class AddDefaultAvatarToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :avatar, :string, :default => "avatar.png"
  end
end
