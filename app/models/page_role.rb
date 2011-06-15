class PageRole < ActiveRecord::Base

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/page_roles/app/models/page_role.rb"
  end
  
end
