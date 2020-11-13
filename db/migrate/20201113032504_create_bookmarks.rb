class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :member_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
