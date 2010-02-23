class AddPublishedColumnToMenusTable < ActiveRecord::Migration
  def self.up
    add_column :menus, :published, :boolean, :default => false
  end

  def self.down
  end
end
