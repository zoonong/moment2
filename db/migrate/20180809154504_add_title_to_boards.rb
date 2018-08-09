class AddTitleToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :title, :string
    add_column :boards, :user_name, :string
    add_column :boards, :content, :text
    add_reference :boards, :category, index: true, foreign_key: true
  end
end
