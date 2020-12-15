class AddDefaultBrandColorToCompanies < ActiveRecord::Migration[6.0]
  def change
    change_column_default :companies, :brand_color, "#28a745"
  end
end
