require 'rails_helper'

RSpec.describe Admin::DecksController, type: :controller do
  describe "GET #index" do
    it "assigns the master deck" do
      user = FactoryGirl.create(:admin_user)

      sign_in user

      get :index
      expect(assigns(:decks)).to eq(Deck.master)
    end
  end

  describe "POST #create" do
    context "attributes are valid" do
      it "saves the deck" do
        user = FactoryGirl.create(:admin_user)

        sign_in user

        expect {
          post :create, deck: FactoryGirl.attributes_for(:deck, master: true)
        }.to change(Deck, :count).by(1)
      end
    end

    context "attributes are invalid" do
      it "doesn't save the deck" do
        user = FactoryGirl.create(:admin_user)
        
        sign_in user

        expect {
          post :create, deck: FactoryGirl.attributes_for(:deck, title: nil, master: true)
        }.to change(Deck, :count).by(0)
      end
    end
  end

end
