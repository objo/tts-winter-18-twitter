require 'rails_helper'

describe User do 
  
  it 'returns the full name of our user' do
    user = build(:user, first_name: 'first', last_name: 'last')
    
    expect(user.full_name).to eq('first last')
  end
  
  it 'returns the location as a single string' do 
    user = build(:user, city: 'Westerville', state: 'OH')
    
    expect(user.location).to eq('Westerville, OH')
  end
  
  it "validates uniqueness of name" do 
    validate_uniqueness_of :username 
  end
  
  it "has many tweets" do 
    have_many :tweets
  end
  
end