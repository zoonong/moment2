class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
