class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :size
      t.string :image_url
      t.float :price
      t.boolean :sold, default: false

      t.timestamps
    end
  end
end
