class CreatePageRoles < ActiveRecord::Migration

  def self.up
    create_table :page_roles, :force => true do |t|
      t.references :page
      t.references :role
      t.boolean :can_read, :default => true
    end

    load(Rails.root.join('db', 'seeds', 'page_roles.rb'))
  end

  def self.down
    drop_table :page_roles
  end

end
