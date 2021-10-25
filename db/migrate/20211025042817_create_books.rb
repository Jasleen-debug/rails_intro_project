class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.date :publication_date
      t.integer :num_pages
      t.decimal :average_listing
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
