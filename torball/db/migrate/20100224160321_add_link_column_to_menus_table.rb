class AddLinkColumnToMenusTable < ActiveRecord::Migration
  def self.up
    change_table :menus do |t|
      t.references :link
    end
  end

  def self.down
    change_table :menus do |t|
      t.remove :link_id
    end
  end
end
