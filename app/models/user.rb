class User < ApplicationRecord
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def location
    "#{city}, #{state}"
  end
end
