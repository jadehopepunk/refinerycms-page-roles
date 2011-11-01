# raise PagesController.inspect

module PageRolesPagesControllerExtension
  def self.included(base)
    base.before_filter :check_access_to_page
  end
  
  def check_access_to_page
    load_page.accessible_by_user?(current_user, :read)
  end
  
  private
  
    def load_page
      @page ||= begin
        if params[:id]
          Page.find("#{params[:path]}/#{params[:id]}".split('/').last)
        else
          Page.where(:link_url => '/').first
        end
      end
    end
end