class CreateAnonymousRole < ActiveRecord::Migration
  def self.up
    Role.create!(:title => 'Anonymous')
  end

  def self.down
    Role.where(:title => 'Anonymous').destroy
  end
end
