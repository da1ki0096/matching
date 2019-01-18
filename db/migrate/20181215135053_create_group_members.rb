class CreateGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_members do |t|
      t.references :user
      t.references :group
      t.boolean :admin, default: false, null: false
      t.boolean :master, default: false, null: false
      t.timestamps
    end
  end
end
