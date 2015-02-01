require 'rails_helper'

describe 'User Sign In' do
  
  describe 'successful email sign in' do
    it "redirects to the user page" do
      user = create(:user)
      visit root_path
      
      click_link('Sign In')
      
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      
      within 'form' do
        click_button 'Sign In'
      end
      
      expect(current_path).to eq user_path
      expect(page).to have_content 'My Trades'
    end
  end
  
  describe 'successful facebook sign in' do
    it "redirects to the user page" do
      user = create(:user)
      visit root_path
      
      click_link('sign in with Facebook')
      
      expect(current_path).to eq user_path
      expect(page).to have_content 'My Trades'
    end
  end
end