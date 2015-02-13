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
      create(:user_workplace, user: @user, workplace: @workplace)

      expect(page).to have_content "Your request to join #{@workplace.name} has been submitted."
    end
    
    it 'displays user-submitted shift requests' do
    end
  end
end