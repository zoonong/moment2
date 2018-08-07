class AddCategoryToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :category, index: true, foreign_key: true
  end
end
