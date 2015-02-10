require 'rails_helper'

describe 'user sign in' do
  
  describe 'by email' do
    
    before do
      @user = create(:user)
      login_as @user, scope: :user
    end
    
    it 'prompts users without workplaces to find one' do
      visit root_path
      expect(page).to have_content "Let's find your workplace."
    end
    
    it "redirects to the user page" do
      workplace = create(:workplace)
      create(:user_workplace, user: @user, workplace: workplace)
      visit root_path
      expect(page).to have_content 'My Trades'
    end
  end
  
  describe 'by facebook' do
    it "redirects to user page" do
      visit user_session_path
      test_omniauth
      click_link('Sign in with Facebook')
      
      visit root_path
      expect(page).to have_content "Let's find your workplace."
    end
  end
end