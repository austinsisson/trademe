require 'rails_helper'

include Warden::Test::Helpers

describe 'user sign in' do
  
  describe 'by email' do
    it "redirects to the user page" do
      user = create(:user)
      login_as user, scope: :user
      
      visit user_path(user)
      expect(page).to have_content 'My Trades'
    end
  end
  
  describe 'by facebook' do
    it "redirects to the user page" do
      user = create(:test_user)
      user.save
      click_link('sign in with Facebook')
      
      visit user_path(user)
      expect(page).to have_content 'My Trades'
    end
  end
end