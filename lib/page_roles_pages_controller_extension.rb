# raise PagesController.inspect

module PageRolesPagesControllerExtension
  def self.included(base)
    puts "extending pages controller"
    base.before_filter :check_access_to_page
  end
  
  def check_access_to_page
    raise "extension show"
  end  
  
  def show
    raise "calling show"
  end
end