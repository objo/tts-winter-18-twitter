class Tweet < ApplicationRecord
  
  belongs_to :user
  
  validates :message, length: { maximum: 140 }
  
  default_scope { order(created_at: :desc) }
  
end
