class AddSubtitleToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :subtitle, :string
  end
end
