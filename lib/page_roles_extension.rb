module PageRolesExtension
  def self.included(base)
    base.attr_accessible :readable_role_ids
    base.has_many :page_roles, :dependent => :destroy
  end

  def readable_role_ids=(ids)
    integer_ids = ids.reject(&:blank?).map(&:to_i)
    add_missing_page_roles
    page_roles.each do |page_role|
      page_role.can_read = integer_ids.include?(page_role.id)
    end
  end
  
  def readable_by_role?(role)
    page_role = page_roles.where(:role_id => role.id).first
    !page_role || page_role.can_read
  end
  
  private
  
    def add_missing_page_roles
      existing_roles = self.page_roles.map(&:role)
      new_roles = Role.all - existing_roles
      new_roles.each do |role|
        self.page_roles.build(:role => role)
      end
    end
end