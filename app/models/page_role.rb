class PageRole < ActiveRecord::Base
  belongs_to :page
  belongs_to :role
  
  scope :readable, where(:can_read => true)

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/page_roles/app/models/page_role.rb"
  end
  
end
