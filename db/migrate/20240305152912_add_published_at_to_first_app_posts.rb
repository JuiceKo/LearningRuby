class AddPublishedAtToFirstAppPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :first_app_posts, :published_at, :datetime
  end
end
