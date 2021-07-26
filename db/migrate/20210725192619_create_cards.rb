class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.integer :list_id

      t.timestamps
    end
  end
end
