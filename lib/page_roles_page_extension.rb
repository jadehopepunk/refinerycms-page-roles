module PageRolesPageExtension
  def self.included(base)
    base.attr_accessible :readable_role_ids
    base.has_many :page_roles, :dependent => :destroy, :autosave => true
    base.has_many :roles, :through => :page_roles
  end

  def readable_role_ids=(ids)
    integer_ids = ids.reject(&:blank?).map(&:to_i)
    add_missing_page_roles
    page_roles.each do |page_role|
      page_role.can_read = integer_ids.include?(page_role.role.id)
    end
  end

  def readable_by_role?(role)
    role.superuser? || readable_by_non_superuser_role?(role)
  end
  
  def accessible_by_user?(user, action = :read)
    raise ArgumentError unless action == :read
    readable_by_user?(user)
  end

  private
  
    def readable_by_user?(user)
      roles.empty? || (user && user.can_access_resource?(roles, :read))
    end

    def readable_by_non_superuser_role?(role)
      page_role = page_roles.where(:role_id => role.id).first
      !page_role || page_role.can_read
    end

    def add_missing_page_roles
      existing_roles = self.page_roles.map(&:role)
      new_roles = Role.not_superuser.all - existing_roles
      new_roles.each do |role|
        self.page_roles.build(:role => role)
      end
    end
end