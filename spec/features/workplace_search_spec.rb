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
    
    it 'informs the user if no results are found' do
      visit root_path
      fill_in 'Workplace', with: 'Nothing'
      fill_in 'City', with: 'Nowhere'
      click_button 'Search'
      
      expect(page).to have_content 'No workplaces match your search'
    end
    
    it 'prompts anyone to add a new workplace' do
      visit workplaces_path
      expect(page).to have_link "Add it!"
    end
    
    it 'allows users to add a new workplace' do
      visit workplaces_path
      user = create(:user)
      login_as user, scope: :user
      
      click_link "Add it!"
      expect(page).to have_content "Add a new workplace"
    end
    
    it 'redirects guests that try to add a workplace' do
      visit workplaces_path
      click_link "Add it!"
      
      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(page).to have_content "Sign up"
    end
    
    it 'lets users join a workplace' do
      user = create(:user)
      login_as user, scope: :user
      visit root_path
      fill_in 'Workplace', with: 'Chipotle'
      fill_in 'City', with: 'Indianapolis'
      click_button 'Search'
      
      click_link 'Join it!'
    
      expect(page).to have_content "You can access the workplace site after a co-worker has approved you."
    end
    
    it 'does not let guests join a workplace' do
      visit root_path
      fill_in 'Workplace', with: 'Chipotle'
      fill_in 'City', with: 'Indianapolis'
      click_button 'Search'
      
      click_link 'Join it!'
      
      expect(page).to have_content "You need to sign in or sign up before continuing."
      expect(page).to have_content "Sign up"
    end
  end
end
      
    