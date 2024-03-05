class CreateFirstAppPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :first_app_posts do |t|
      t.string :titl
      t.text :body

      t.timestamps
    end
  end
end
