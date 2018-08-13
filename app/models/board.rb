class Board < ActiveRecord::Base
    belongs_to :profile
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
end
