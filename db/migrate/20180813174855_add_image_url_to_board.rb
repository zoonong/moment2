class AddImageUrlToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :image_url, :string
  end
end
