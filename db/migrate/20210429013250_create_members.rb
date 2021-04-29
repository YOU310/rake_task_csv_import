class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :nickname
      t.string :belong

      t.timestamps
    end
  end
end
