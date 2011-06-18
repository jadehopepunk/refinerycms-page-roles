module PageRoles
  module RoleExtension
    def self.included(base)
      base.class.send(:include, ClassMethods)
      base.scope :not_superuser, base.where("title != 'Superuser'")
    end
    
    module ClassMethods
      def superuser
        find_by_title("Superuser")
      end
    end
  end
end