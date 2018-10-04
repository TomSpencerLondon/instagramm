require "rails_helper"

RSpec.describe "Pics Controller", :type => :request do
  describe "#index" do 
    context "when there are no pictures" do 
      it "shows a message" do 
        get "/"
        expect(response.body).to include("No pictures yet.")
        expect(response.body).to include('<a href="/pics/new">here</a>')
      end 
    end 
    context "when there are pictures" do 
      before do 
        user = User.create(email: "test@test.co.uk", password: "test123")
        5.times { Pic.create(title: "Surfing pic", description: "Me surfing in Hawaii", user: user) }
      end  
      it "does not show the no pictures message" do 
        get "/"
        expect(response.body).not_to include("No pictures yet. You can upload them here.")
      end 

      it "has a link to each image" do 
        get "/"
        expect(response.body).to include('<a href="/pics/1">')
      end 
    end 
  end 

  describe "#show" do 
    
  end 
  # it "creates a Widget and redirects to the Widget's page" do
  #   get "/widgets/new"
  #   expect(response).to render_template(:new)

  #   post "/widgets", :widget => {:name => "My Widget"}

  #   expect(response).to redirect_to(assigns(:widget))
  #   follow_redirect!

  #   expect(response).to render_template(:show)
  #   expect(response.body).to include("Widget was successfully created.")
  # end

  # it "does not render a different template" do
  #   get "/widgets/new"
  #   expect(response).to_not render_template(:show)
  # end
end