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

end


# Register new user
#   Manual
#   Facebook
# end
#
# User forgot Password
#   confirm user by email/text
#     Update password
#   end
# end
#
# sign out destroys session
#
# If signed in Show
#   Sign out
# else
#   sign in
#   Register
#   forgot Password
# end
