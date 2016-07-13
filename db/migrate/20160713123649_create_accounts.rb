class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :degree_before
      t.integer :degree_after
      t.string :birth_name
      t.string :birth_date
      t.integer :gender
      t.string :birth_place
      t.string :birth_number
      t.string :nationality
      t.integer :family_status
      t.string :bank_acc
      t.string :insurance
      t.string :occupation
      t.boolean :terms
      t.integer :status

      t.timestamps null: false
    end
  end
end
