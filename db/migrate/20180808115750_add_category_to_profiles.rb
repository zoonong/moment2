class AddCategoryToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :category, index: true, foreign_key: true
  end
end
