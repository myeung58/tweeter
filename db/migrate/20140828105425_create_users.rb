class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |col|
      col.string :first_name
      col.string :last_name
      col.string :username
      col.string :email
      col.string :password
      col.text   :about
      col.string :location

      col.timestamps
    end
  end
end
