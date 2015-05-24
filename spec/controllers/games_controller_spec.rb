require 'rails_helper'

describe GamesController do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "redirects to the new contact" do 
      post :create, game: attributes_for(:game) 
      expect(response).to redirect_to Game.last 
    end 
  end

  describe "GET #show" do
    it "renders the #show view" do 
      get :show, id: create(:game)
      expect(response).to render_template :show
     end
  end

  describe "GET #ranking" do
    it "returns http success" do
      get :ranking
      expect(response).to have_http_status(:success)
    end
  end

end
