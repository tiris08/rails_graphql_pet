class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :publisher
      t.date :published_at
      t.integer :pages_count

      t.timestamps
    end
  end
end
