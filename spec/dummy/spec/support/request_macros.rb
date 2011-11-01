# module RequestMacros
#   def login_refinery_user
#     before (:each) do
#       @refinery_user = Factory(:refinery_user)
#       visit new_user_session_path
#       within('#user_new') do
#         fill_in 'Login', :with => @refinery_user.username
#         fill_in 'Password', :with => @refinery_user.password
#         click_on 'Sign in'
#       end
#     end
#   end
# end
