require 'rails_helper'

RSpec.describe DecksController, type: :controller do
  describe "GET #index" do
    it "assigns the master deck" do
      user = FactoryGirl.create(:user)

      sign_in user
      get :index

      expect(assigns(:decks)).to eq(Deck.master)
    end
  end

  describe "GET #show" do
    it "assigns the correct deck" do
      user = FactoryGirl.create(:user)
      deck = FactoryGirl.create(:deck)

      sign_in user
      get :show, id: deck.id
      
      expect(assigns(:deck)).to eq(deck)
      expect(response).to render_template :show
    end
  end

  # describe "POST #create" do
  #   context "attributes are valid" do
  #     it "saves the deck" do
  #       user = FactoryGirl.create(:admin_user)
  #       sign_in user

  #       expect {
  #         post :create, deck: FactoryGirl.attributes_for(:deck, master: true)
  #       }.to change(Deck, :count).by(1)
  #       expect(response.status).to redirect_to admin_decks_path
  #     end
  #   end

  #   context "attributes are invalid" do
  #     it "doesn't save the deck" do
  #       user = FactoryGirl.create(:admin_user)
  #       sign_in user

  #       expect {
  #         post :create, deck: FactoryGirl.attributes_for(:deck, title: nil, master: true)
  #       }.to change(Deck, :count).by(0)
  #       expect(response.status).to render_template :new
  #     end
  #   end
  # end

end
