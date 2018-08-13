class CreateJoinTableBoardsHashtags < ActiveRecord::Migration
  def change
    create_join_table :boards, :hashtags do |t|
      # t.index [:board_id, :hashtag_id]
      # t.index [:hashtag_id, :board_id]
    end
  end
end
