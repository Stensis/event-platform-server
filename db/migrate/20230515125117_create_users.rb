class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :username
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :role
      t.string :profilepicture
      t.integer :tel

      t.timestamps
    end
  end
end
