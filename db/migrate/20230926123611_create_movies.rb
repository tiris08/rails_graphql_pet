class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.string :production_company
      t.date :filmed_at

      t.timestamps
    end
  end
end
