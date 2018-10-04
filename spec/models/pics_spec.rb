require "rails_helper"

RSpec.describe Pic do
  it "creates a Pic with title and description" do 
    pic = Pic.create(title: "Surfing", description: "Me surfing in Hawaii")
    expect(pic.title).to eq("Surfing")
    expect(pic.description).to eq("Me surfing in Hawaii")
    expect(pic.image.class).to eq(Paperclip::Attachment)
    expect(pic.image.url(:medium)).to eq("/images/medium/missing.png")
  end
end