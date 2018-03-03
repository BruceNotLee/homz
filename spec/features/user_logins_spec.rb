require 'rails_helper'

RSpec.feature "User login", type: :feature do
  let!(:user) do
    User.create(email: "matt@homz.com", password: "0912lkjs")
  end
  it "user successfully logs in" do
    visit 'users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
  end
  pending "Register new user Manual"
  pending "Register new user Facebook"
  pending "User forgot Password"
  pending "confirm user by email/text"
  pending "password Updated"
  pending "sign out destroys session"
  pending "If signed in Show 'Sign out'"
  pending "Not signed in see 'sign in, Register, forgot Password'"
end
