require 'rails_helper'

describe "All routes" do

  it "routes profile to users#profile" do
    expect(get("/users/profile")).to route_to(controller: "users", action: "profile")
  end
  
end
