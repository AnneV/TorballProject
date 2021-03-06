class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :name
      t.boolean :published
      t.references :menu
      t.references :page
      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
