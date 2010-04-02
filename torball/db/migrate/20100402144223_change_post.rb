class ChangePost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.remove :category
      t.references :category
    end
  end

  def self.down
    change_table :posts do |t|
       t.remove :category_id
       t.string :category
    end
  end
end
