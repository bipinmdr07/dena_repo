require 'rails_helper'

RSpec.describe CardsController, type: :controller do

  describe "GET #index" do
    it "renders the index view" do
      user = FactoryGirl.create(:user)

      sign_in user
      get :index

      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "displays the card" do
      user = FactoryGirl.create(:user)
      deck = FactoryGirl.create(:deck, master: true)
      card = FactoryGirl.create(:card, master: true, deck_id: deck.id)

      sign_in user
      get :show, deck_id: deck.id, id: card.id

      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      user = FactoryGirl.create(:user)

      sign_in user
      get :new

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "attributes are valid" do
      it "creates a new card" do
        user = FactoryGirl.create(:user)

        sign_in user

        expect {
          post :create, card: FactoryGirl.attributes_for(:card, user_id: user.id), format: :json
        }.to change(Card, :count).by(1)
      end
    end

    context "attributes are invalid" do
      it "doesn't create a card" do
        user = FactoryGirl.create(:user)

        sign_in user

        expect {
          post :create, card: FactoryGirl.attributes_for(:card, question: nil), format: :json
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe "GET #edit" do
    context "card owner is current_user" do
      it "doesn't render the edit template" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id)

        sign_in user
        get :edit, id: card.id

        expect(response).to render_template :edit
      end
    end

    context "card owner is not current_user" do
      it "doesn't render the edit template" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id + 1)

        sign_in user
        get :edit, id: card.id

        expect(response).to redirect_to cards_path
      end
    end
  end

  describe "PATCH #update" do
    context "card owner is current_user" do
      it "updates the card" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id)

        sign_in user
        patch :update, id: card.id, card: FactoryGirl.attributes_for(:card, user_id: user.id, question: "Has this changed?")
        card.reload

        expect(card.question).to eq("Has this changed?")
      end
    end

    context "card owner is not current_user" do
      it "doesn't update the card" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id + 1)

        sign_in user
        patch :update, id: card.id, card: FactoryGirl.attributes_for(:card, user_id: user.id, question: "Has this changed?")
        card.reload

        expect(card.question).to_not eq("Has this changed?")
      end
    end
  end

  describe "DELETE #destroy" do
    context "card owner is current_user" do
      it "destroys the card" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id)

        sign_in user

        expect {
          delete :destroy, id: card.id, format: :js
        }.to change(Card, :count).by(-1)
      end
    end

    context "card owner is not current_user" do
      it "doesn't destroy the card" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id + 1)

        sign_in user

        expect {
          delete :destroy, id: card.id, format: :js
        }.to change(Card, :count).by(0)
      end
    end
  end

  describe "PATCH #archive" do
    context "card owner is current_user" do
      it "archives the card" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id)

        sign_in user
        patch :archive, card_id: card.id, format: :js
        card.reload

        expect(card.archived).to be(true)
      end
    end

    context "card owner is not current_user" do
      it "doesn't archive the card" do
        user = FactoryGirl.create(:user)
        card = FactoryGirl.create(:card, user_id: user.id + 1)

        sign_in user
        patch :archive, card_id: card.id, format: :js
        card.reload

        expect(card.archived).to be(false)
      end
    end
  end
end
