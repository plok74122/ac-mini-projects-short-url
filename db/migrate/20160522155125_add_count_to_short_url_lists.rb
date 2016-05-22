class AddCountToShortUrlLists < ActiveRecord::Migration
  def change
    add_column :short_url_lists , :count , :integer ,:default => 0
  end
end
