class Category < ApplicationRecord
  has_many :tags
  has_many :tweets, through: :tags
end
