require 'rails_helper'

RSpec.describe Admin::CardsController, type: :controller do
	describe "POST #create" do
		context "attributes are valid" do
			it "creates a new card" do
				user = FactoryGirl.create(:admin_user)
				deck = FactoryGirl.create(:deck)
				sign_in user

				expect{
					post :create, card: FactoryGirl.attributes_for(:master_card), deck_id: deck.id
				}.to change(Card, :count).by(1)	
				expect(response.status).to redirect_to admin_deck_path(deck)
			end
		end
		
		context "attributes are invalid" do
			it "doesn't create a new card" do
				user = FactoryGirl.create(:admin_user)
				deck = FactoryGirl.create(:deck)
				sign_in user

				expect{
					post :create, card: FactoryGirl.attributes_for(:master_card, answer: nil), deck_id: deck.id
				}.to change(Card, :count).by(0)	
			end
		end

	end
end
