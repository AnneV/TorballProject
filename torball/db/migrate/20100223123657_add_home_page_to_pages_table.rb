class AddHomePageToPagesTable < ActiveRecord::Migration
  def self.up
    add_column :pages, :home, :boolean, :default => false
  end

  def self.down
    remove_column :pages, :home
  end
end
