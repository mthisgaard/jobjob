class AddLogoUrlToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :logo_url, :string, :default => "company.svg"
  end
end
