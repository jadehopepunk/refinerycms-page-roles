module PageRolesRoleExtension
  SUPERUSER_TITLE = 'Superuser'
  
  def self.included(base)
    base.class.send(:include, ClassMethods)
    base.scope :not_superuser, base.where(["title != ?", SUPERUSER_TITLE])
  end
  
  def superuser?
    title == SUPERUSER_TITLE
  end
  
  module ClassMethods
    def superuser
      find_by_title(SUPERUSER_TITLE)
    end
  end
end