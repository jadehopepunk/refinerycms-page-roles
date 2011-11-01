require 'spec_helper'

require 'pages_controller'
require 'refinerycms-page_roles.rb'

describe PagesController do
  include Devise::TestHelpers
  
  let(:member_role) { Role.create!(:title => 'Member') }
  let(:user) { User.create!(:username => 'bilbobaggins', :email => 'bilbo@baggins.com', :password => 'shire') }
    
  describe "GET #show" do
    before :each do
      # raise (@controller.methods - ApplicationController.instance_methods).inspect
      @page = Page.create!(:title => 'Sample page')      
      @controller.stub!(:params).and_return({:id => @page.to_param})
    end
    
    describe "when not logged in" do
      it "should show page if page is readable by any role" do
        @controller.check_access_to_page.should == true
      end
      
      # it "should not show page is page requires a specific role to view"
    end
    
    describe "when logged in" do
      before :each do
        sign_in user
      end
      
      it "should show page if page is readable by role of current user" do
        @page.roles << member_role
        user.roles << member_role
        
        @controller.check_access_to_page.should == true
      end
      
      it "should show page if no roles are specified" do
        @controller.check_access_to_page.should == true
      end
      
      it "should not show page if page has role but user does not" do
        @page.roles << member_role
        
        @controller.check_access_to_page.should be_false
      end
    end
  end
end