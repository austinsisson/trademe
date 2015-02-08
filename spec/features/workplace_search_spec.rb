require 'rails_helper'

describe 'workplace search' do
  
  before do
    create(:workplace)
  end
  
  describe 'by name and location' do
    it 'displays all listed workplaces' do
      visit root_path
      fill_in 'Workplace', with: 'Chipotle'
      fill_in 'City', with: 'Indianapolis'
      click_button 'Search'

      expect(page).to have_content '4625 East 96th Street'
    end
    
    it 'prompts guests to sign up' do
      visit workplaces_path
      expect(page).to have_link 'Sign Up Today!'
      
      click_link 'Sign Up Today!'
      expect(page).to have_content 'Sign up'
    end
  
    it 'does not prompt users to sign up' do
      user = create(:user)
      login_as user, scope: :user
      visit workplaces_path
      
      expect(page).not_to have_button 'Sign Up Today!'
    end
    
    it 'prompts anyone to add a new workplace' do
      visit workplaces_path
      expect(page).to have_link "Don't see your workplace? Add it!"
      
      click_link "Don't see your workplace? Add it!"
      if current_user.present?
        expect(page).to have_content "Add a new workplace"
      else
        expect(page).to have_content "Hey, you've gotta be signed in to do that!"
        expect(page).to have_content "Sign Up"
      end
    end
  end
end
      
    