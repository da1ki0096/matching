class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.boolean :public, default: true, null: false

      t.timestamps
    end
  end
end
