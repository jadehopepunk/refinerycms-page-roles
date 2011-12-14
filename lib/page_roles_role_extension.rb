module PageRolesRoleExtension
  SUPERUSER_TITLE = 'Superuser'
  ANONYMOUS_TITLE = 'Anonymous'

  def self.included(base)
    base.class.send(:include, ClassMethods)
    base.scope :not_superuser, base.where(["title != ?", SUPERUSER_TITLE])
    base.scope :admin_order, base.order("title = '#{SUPERUSER_TITLE}' DESC, title != '#{ANONYMOUS_TITLE}' DESC, id ASC")
  end

  def superuser?
    title == SUPERUSER_TITLE
  end

  def anonymous?
    false
  end

  module ClassMethods
    def superuser
      find_by_title(SUPERUSER_TITLE)
    end
    
    def anonymous
      find_by_title(ANONYMOUS_TITLE)
    end
  end
end