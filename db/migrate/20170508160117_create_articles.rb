class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string  :title, null: false
      t.string  :description, null: false
      t.string  :email, null: false
      t.string  :price
      t.integer :zip_code
      t.string  :edit_id, null: false
      t.integer :category_id

      t.timestamps(null: false)

    end
  end
end
