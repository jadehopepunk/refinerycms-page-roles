# module ControllerMacros
#   def login_refinery_user
#     before (:each) do
#       @refinery_user = Factory(:refinery_user)
#       @request.env["devise.mapping"] = Devise.mappings[:admin]
#       sign_in @refinery_user
#     end
#   end
# end
