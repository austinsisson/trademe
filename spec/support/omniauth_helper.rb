module OmniauthHelper
  def test_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid:     '1234',
      info: {
        email:      'testuser@example.com',
        gender:     'Female',
        first_name: 'Test',
        last_name:  'User'
      }
    })
  end
end