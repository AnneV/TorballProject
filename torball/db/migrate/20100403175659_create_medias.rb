class CreateMedias < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.string :title
      t.string :file_name
      t.references :user
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :medias
  end
end
