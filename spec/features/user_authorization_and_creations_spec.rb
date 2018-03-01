require 'rails_helper'

RSpec.feature "User authorization and creations", type: :feature do
  let!(:user) do
    User.create(email: "homzcode@homzdirect.com", password: "homzey123")
  end
  it "successful registration and creation" do
  # visits registration pages
  visit '/users/sign_up'
  # fill in the email and password
  sign_in(user)
  # sign in with facebook

  #  click submit
  # click_button 'Sign up'
  expect(page).to have_content "Landing Page"
end

# it "short password" do
#   visit register_path
#   # fill in the username and password
#   fill_in 'Username', with: 'username'
#   fill_in 'Password', with: '123'
#   fill_in 'Password confirmation', with: '123'
#   click_button 'Create'
#
#   expect(page).to have_content "Password is too short"
#
#
# end
#
# it "doesn't have facebook"
end
