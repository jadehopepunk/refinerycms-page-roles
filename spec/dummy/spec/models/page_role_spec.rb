# require 'spec_helper'
# require 'page_role'
# 
# describe PageRole do
# 
#   def reset_page_role(options = {})
#     @valid_attributes = {
#       :id => 1
#     }
# 
#     @page_role.destroy! if @page_role
#     @page_role = PageRole.create!(@valid_attributes.update(options))
#   end
# 
#   before(:each) do
#     reset_page_role
#   end
# 
#   context "validations" do
#     
#   end
# 
# end