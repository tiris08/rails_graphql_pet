class CreateCompositionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :composition_items do |t|
      t.references :composable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
