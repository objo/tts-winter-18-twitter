class Tweet < ApplicationRecord
  has_many :tags
  has_many :categories, through: :tags
  belongs_to :user
    
  after_save :create_categories
  
  validates :message, length: { maximum: 140 }
  
  default_scope { order(created_at: :desc) }
  
  private 
  
  def create_categories
    message.split.each do |word| 
      if word.starts_with?('#')
        c = Category.find_or_create_by(name: word.slice(1, word.length))
        tags.create(category: c)
      end
    end
  end
  
end
