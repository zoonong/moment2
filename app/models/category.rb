class Category < ActiveRecord::Base
    has_many :boards
    has_many :profiles
end
