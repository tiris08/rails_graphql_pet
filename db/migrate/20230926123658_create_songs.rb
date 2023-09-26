class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :band_name
      t.integer :duration
      t.references :album, null: false, foreign_key: true
      t.date :released_at

      t.timestamps
    end
  end
end
