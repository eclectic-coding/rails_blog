class AddFieldsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :series, :string
    add_column :posts, :description, :text
    add_column :posts, :is_published, :boolean, default: false
  end
end
