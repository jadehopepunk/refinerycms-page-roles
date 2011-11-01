# raise PagesController.inspect

module PageRolesPagesControllerExtension
  def self.included(base)
    base.alias_method_chain :show, :access_check
  end
  
  def show_with_access_check
    show_without_access_check
    check_access_to_page
  end
  
  def check_access_to_page
    unless @page.accessible_by_user?(current_user, :read)
      error_404
      return false
    end
  end
end