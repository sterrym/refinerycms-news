class CreateNewsItems < ActiveRecord::Migration

  def self.up
    create_table ::Refinery::NewsItem.table_name, :id => true do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date

      t.timestamps
    end

    add_index ::Refinery::NewsItem.table_name, :id
  end

  def self.down
    ::Refinery::UserPlugin.destroy_all :name => "refinerycms_news"

    ::Refinery::Page.delete_all :link_url => "/news"

    drop_table ::Refinery::NewsItem.table_name
  end

end