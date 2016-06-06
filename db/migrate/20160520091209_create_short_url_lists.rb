class CreateShortUrlLists < ActiveRecord::Migration
  def change
    create_table :short_url_lists do |t|
      t.string :unique_string, null: false
      t.string :redirect_to, null: false
      t.timestamps null: false
    end
    add_index :short_url_lists, :unique_string, :unique => true
  end
end
