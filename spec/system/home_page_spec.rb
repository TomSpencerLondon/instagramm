require "rails_helper"

RSpec.describe "View", :type => :system do

  it "allows me to upload an image" do
    user = User.create(email: "test@test.co.uk", password: "test123")
    pic = Pic.create(title: "Surfing pic", description: "Me surfing in Hawaii", user: user, image_file_name: Rails.root + "spec/fixtures/surfing.jpeg")   
    visit "/"
    click_link('Surfing pic')
  end
end