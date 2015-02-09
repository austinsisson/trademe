require 'rails_helper'

describe 'add workplace' do
  
  before do
    create(:workplace)
    user = create(:user)
    login_as user, scope: :user
  end
  
  it 'lets users create a new workplace and redirects after creation' do
    visit new_workplace_path
    
    fill_in('Name', with: 'Mayberry Cafe')
    fill_in('Address', with: '1234 American Pie Blvd')
    fill_in('City', with: 'Mayberry')
    select 'Indiana', from: 'State'
    click_button 'Add this workplace'
    
    expect(page).to have_content 'Mayberry Cafe'
  end
  
  it 'will not allow duplicate workplaces' do
    visit new_workplace_path
    
    fill_in('Name', with: 'Chipotle')
    fill_in('Address', with: '4625 East 96th Street')
    fill_in('City', with: 'Indianapolis')
    select 'Indiana', from: 'State'
    click_button 'Add this workplace'
    
    expect(page).to have_content 'This workplace already exists!'
  end
end