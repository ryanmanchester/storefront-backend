class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :image_url
      t.string :password_digest

      t.timestamps
    end
  end
end
