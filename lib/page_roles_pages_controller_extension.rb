# raise PagesController.inspect

module PageRolesPagesControllerExtension
  def self.included(base)
    base.before_filter :check_access_to_page
  end
  
  def check_access_to_page
    load_page.readable_by_user?(current_user)
  end
  
  private
  
    def load_page
      @page ||= Page.find("#{params[:path]}/#{params[:id]}".split('/').last)
    end
end