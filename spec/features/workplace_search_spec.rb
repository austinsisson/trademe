require 'rails_helper'

describe 'workplace search' do
  
  before do
    test1 = Workplace.new(
      name: 'Chipotle',
      city: 'Indianapolis',
      state: 'Indiana',
      address: '4625 East 96th Street'
      )
    test1.save
  end
  
  describe 'by name and location' do
    it 'displays all listed workplaces' do
      visit root_path
      fill_in 'Workplace', with: 'Chipotle'
      fill_in 'City', with: 'Indianapolis'
      click_button 'Search'

      expect(page).to have_content '4625 East 96th Street'
      #expect(page).to have_text '3340 West 86th Street'
      #expect(page).to have_text '1002 Broad Ripple Avenue'
    end
    
    it 'prompts non-users to sign up' do
      unless current_user.present?
        visit search_path
        expect(page).to have_button 'Sign Up Today!'
      
        click_button 'Sign Up Today!'
        expect(page).to have_content 'Sign Up'
      end
    end
    
    it 'prompts anyone to add a new workplace' do
      visit search_path
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
      
    