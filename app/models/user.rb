class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #paperclip
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
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
