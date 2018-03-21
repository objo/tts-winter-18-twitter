class User < ApplicationRecord
  devise :database_authenticatable, 
  :registerable, :recoverable, 
  :rememberable, :trackable, 
  :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  validates :username, uniqueness: true
  
  has_many :tweets
  
  serialize :following, Array
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def location
    "#{city}, #{state}"
  end
end
