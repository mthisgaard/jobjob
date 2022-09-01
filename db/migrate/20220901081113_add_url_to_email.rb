class AddUrlToEmail < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :url, :string
  end
end
