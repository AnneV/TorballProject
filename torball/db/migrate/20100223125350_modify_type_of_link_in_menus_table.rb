class ModifyTypeOfLinkInMenusTable < ActiveRecord::Migration
  def self.up
    change_table :menus do |t|
      t.remove :link
      t.references :link, :polymorphic => {:default => 'Page'}
      t.remove :menu_id
    end
  end

  def self.down
    change_table :menus do |t|
      t.remove :link
      t.string :link
      t.references :menu
    end
  end
end
