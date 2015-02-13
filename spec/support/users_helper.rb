module UsersHelper
  def workplace_search
    visit root_path
    fill_in 'Workplace', with: 'Chipotle'
    fill_in 'City', with: 'Indianapolis'
    click_button 'Search'
  end
end