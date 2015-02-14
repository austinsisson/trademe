module UsersHelper
  def workplace_search
    visit root_path
    fill_in 'Workplace', with: 'Chipotle'
    fill_in 'City', with: 'Indianapolis'
    click_button 'Search'
  end
  
  def new_workplace
    fill_in 'Name', with: 'Chipotle'
    fill_in 'Address', with: '4625 East 96th Street'
    fill_in 'City', with: 'Indianapolis'
    select 'Indiana', from: 'State'
    click_on 'Add this workplace'
  end
end