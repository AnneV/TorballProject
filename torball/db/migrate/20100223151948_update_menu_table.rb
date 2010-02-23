class UpdateMenuTable < ActiveRecord::Migration
  def self.up
    change_table :menus do |t|
      t.remove :link_id
      t.remove :link_type
      t.string :type
    end
  end

  def self.down
    change_table :menus do |t|
      t.integer :link_id
      t.string :link_type
      t.remove :type
    end

  end
end
