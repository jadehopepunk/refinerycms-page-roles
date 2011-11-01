module PageRolesPagesControllerExtension
  def self.included(base)
    base.before_filter :check_access_to_page
  end
  
  def check_access_to_page
    raise "extension show"
  end  
  
  def show
    raise "calling show"
  end
end