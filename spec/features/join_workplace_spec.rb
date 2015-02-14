require 'rails_helper'

describe 'join workplace' do
  
  describe 'by finding an existing workplace' do
    
    before do
      @user = create(:user)
      @workplace = create(:workplace)
    end
    
    it 'informs users they will need to be approved' do
      login_as @user, scope: :user
      workplace_search
      
      click_on 'Join it!'
      create(:user_workplace, user: @user, workplace: @workplace, pending: true)

      expect(page).to have_content "Your request to join #{@workplace.name} has been submitted."
    end
  end
  
  describe 'by creating a new workplace' do
    
    before do
      @user = create(:user)
    end
    
    it 'makes the creator the moderator of the workplace' do
      login_as @user, scope: :user
      workplace_search
      click_on 'Add it!'
      
      fill_in 'Name', with: 'Chipotle'
      fill_in 'Address', with: '4625 East 96th Street'
      fill_in 'City', with: 'Indianapolis'
      select 'Indiana', from: 'State'
      click_on 'Add this workplace'
      create(:user_workplace, user: @user, workplace: @workplace, pending: false)
      
      expect(page).to have content "Approve User"
    end
  end
end