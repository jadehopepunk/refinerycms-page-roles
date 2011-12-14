# raise PagesController.inspect

module PageRolesPagesControllerExtension
  def self.included(base)
    base.before_filter :check_access_to_page, :only => [:home, :show]
  end
  
  def check_access_to_page
    load_page
    if @page && !@page.accessible_by_user?(current_user, :read)
      error_404
      return false
    end
  end
  
  private
  
    def load_page
      if params[:action] == 'home'
        @page ||= Page.where(:link_url => '/').first
      else
        @page ||= Page.find("#{params[:path]}/#{params[:id]}".split('/').last)
      end
    end
end