class ChangeDefaultvalueForLogoUrl < ActiveRecord::Migration[7.0]
  def change
    change_column_default :jobs, :logo_url, "company_logo.png"
  end
end
