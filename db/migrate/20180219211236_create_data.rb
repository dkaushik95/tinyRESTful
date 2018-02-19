class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.string :url
      t.text :h1
      t.text :h2
      t.text :h3
      t.string :links

      t.timestamps
    end
  end
end
