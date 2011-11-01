module PageRolesUserExtension
  def self.included(base)
  end
  
  def can_access_resource?(resource_roles, action = :read)
    raise 'can access resource isnt implemented'
  end
end