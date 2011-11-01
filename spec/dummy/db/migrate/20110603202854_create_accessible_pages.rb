class CreateAccessiblePages < ActiveRecord::Migration

  def self.up
    create_table :accessible_pages do |t|
      t.integer :user_id
      t.integer :page_id
      t.integer :position

      t.timestamps
    end

    add_index :accessible_pages, :id

    load(Rails.root.join('db', 'seeds', 'accessible_pages.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "accessible_pages"})

    Page.delete_all({:link_url => "/accessible_pages"})

    drop_table :accessible_pages
  end

end
