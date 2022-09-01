class AddContactEmailToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :contact_email, :string
  end
end
