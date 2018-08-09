class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :title
      t.text :content
      t.string :user_name
      
      t.timestamps null: false
    end
  end
end


# <model profile>
# 1.id
# 2.user_id: references
# 3.introduction: text
# 4.play: references
# 5.image