# require 'spec_helper'
# 
# describe "Page which is extended with page role functionality" do
#   def create_page
#     Page.create!(
#       :title => "RSpec is great for testing too",
#       :deletable => true
#     )
#   end
#   
#   def create_role
#     Role.create!(
#       :title => "Member"
#     )
#   end
#   
#   def page_has_role(page, role, can_read)
#     page_role = page.page_roles.where(:role_id => role.id).first
#     page_role.should_not be_nil
#     page_role.can_read.should == can_read
#   end
#   
#   def page_should_not_have_role(page, role)
#     page_role = page.page_roles.where(:role_id => role.id).first
#     page_role.should be_nil
#   end
#   
#   describe "when setting readable page role ids" do
#     before :each do
#       @page = create_page
#       @role = create_role
#     end
#     
#     describe "for included role id" do
#       it "should create a readable page role if none exists" do
#         @page.readable_role_ids = [@role.id.to_s]
#         @page.save!
#         page_has_role(@page, @role, true)
#       end
#       
#       it "should set an unreadable page role to readable" do
#         PageRole.create!(:page => @page, :role => @role, :can_read => false)
#         @page.readable_role_ids = [@role.id.to_s]
#         @page.save!
#         page_has_role(@page, @role, true)
#       end
#       
#       it "should leave a readable page role alone" do
#         PageRole.create!(:page => @page, :role => @role, :can_read => true)
#         @page.readable_role_ids = [@role.id.to_s]
#         @page.save!
#         page_has_role(@page, @role, true)
#       end
#     end
#     
#     describe "for not included role id" do
#       it "should create an unreadable page role if none exists" do
#         @page.readable_role_ids = []
#         @page.save!
#         page_has_role(@page, @role, false)
#       end
#       
#       it "should leave an unreadable page role alone" do
#         PageRole.create!(:page => @page, :role => @role, :can_read => false)
#         @page.readable_role_ids = []
#         @page.save!
#         page_has_role(@page, @role, false)
#       end
#       
#       it "should set a readable page role to unreadable" do
#         PageRole.create!(:page => @page, :role => @role, :can_read => true)
#         @page.readable_role_ids = []
#         @page.save!
#         page_has_role(@page, @role, false)
#       end
#     end
#     
#     describe "for superuser role" do
#       before :each do
#         @superuser = Role.create!(:title => "Superuser")
#       end
#       
#       it "should not create as readable if specified" do
#         @page.readable_role_ids = [@superuser.id.to_s]
#         @page.save!
#         page_should_not_have_role(@page, @superuser)
#       end
#       
#       it "should not create as unreadable if unspecified" do
#         @page.readable_role_ids = []
#         @page.save!
#         page_should_not_have_role(@page, @superuser)
#       end
#     end
#   end
# end