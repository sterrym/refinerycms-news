class AddKioskToNews < ActiveRecord::Migration
  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:kiosk)
      add_column ::NewsItem.table_name, :kiosk, :boolean, :default => false
    end
  end
  
  def self.down
    if ::NewsItem.column_names.map(&:to_sym).include?(:source)
      remove_column ::NewsItem.table_name, :kiosk
    end
  end
end
