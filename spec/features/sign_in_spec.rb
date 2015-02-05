require 'rails_helper'

describe 'user sign in' do
  
  describe 'by email' do
    it "redirects to the user page" do
      user = create(:user)
      login_as user, scope: :user
      
      visit root_path
      expect(page).to have_content 'My Trades'
    end
  end
  
  describe 'by facebook' do
    it "redirects to the user page" do
      visit user_session_path
      test_omniauth
      click_link('Sign in with Facebook')
      
      visit root_path
      expect(page).to have_content 'My Trades'
    end
  end
end