require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "displays the card" do        
      deck = FactoryGirl.create(:deck, master: true)
      card = FactoryGirl.create(:card, master: true, deck_id: deck.id)
      get :show, deck_id: deck.id, id: card.id
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "attributes are valid" do
      it "creates a new card" do
        expect { 
          post :create, card: FactoryGirl.attributes_for(:card, user_id: user.id), format: :js
        }.to change(Card, :count).by(1)
      end
    end

    context "attributes are invalid" do
      it "doesn't create a card" do
        expect { 
          post :create, card: FactoryGirl.attributes_for(:card, question: nil), format: :js
        }.to raise_error(ActiveRecord::RecordInvalid)
      end   
    end
  end

  describe "GET #edit" do
    context "card owner is current_user" do
      it "doesn't render the edit template" do
        card = FactoryGirl.create(:card, user_id: user.id)
        get :edit, id: card.id
        expect(response).to render_template :edit
      end
    end

    context "card owner is not current_user" do
      it "doesn't render the edit template" do
        card = FactoryGirl.create(:card, user_id: user.id + 1)
        get :edit, id: card.id
        expect(response).to redirect_to cards_path
      end
    end
  end

  describe "PATCH #update" do
    context "card owner is current_user" do
      it "updates the card" do
        card = FactoryGirl.create(:card, user_id: user.id)
        patch :update, id: card.id, card: FactoryGirl.attributes_for(:card, user_id: user.id, question: "Has this changed?")
        card.reload
        expect(card.question).to eq("Has this changed?")
      end
    end

    context "card owner is not current_user" do
      it "doesn't update the card" do
        card = FactoryGirl.create(:card, user_id: user.id + 1)
        patch :update, id: card.id, card: FactoryGirl.attributes_for(:card, user_id: user.id, question: "Has this changed?")
        card.reload
        expect(card.question).to_not eq("Has this changed?")
      end
    end
  end

  describe "DELETE #destroy" do
    context "card owner is current_user" do
      it "destroys the card" do
        card = FactoryGirl.create(:card, user_id: user.id)
        expect {
          delete :destroy, id: card.id, format: :js 
        }.to change(Card, :count).by(-1)        
      end
    end

    context "card owner is not current_user" do
      it "doesn't destroy the card" do
        card = FactoryGirl.create(:card, user_id: user.id + 1)
        expect {
          delete :destroy, id: card.id, format: :js  
        }.to change(Card, :count).by(0)      
      end
    end
  end

  describe "PATCH #archive" do
    context "card owner is current_user" do
      it "archives the card" do
        card = FactoryGirl.create(:card, user_id: user.id)
        patch :archive, card_id: card.id, format: :js
        card.reload
        expect(card.archived).to be(true)
      end
    end

    context "card owner is not current_user" do
      it "doesn't archive the card" do
        card = FactoryGirl.create(:card, user_id: user.id + 1)
        patch :archive, card_id: card.id, format: :js
        card.reload
        expect(card.archived).to be(false)
      end
    end
  end
end


