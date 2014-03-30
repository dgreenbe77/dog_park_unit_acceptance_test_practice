class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :dog_name, null: false

      t.timestamps
    end
  end
end
