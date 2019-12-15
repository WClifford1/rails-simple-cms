class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
        t.column "first_name", :string, :limit => 25
        t.string "last_name", :limit => 50
        # Both of these lines add a column to the users table
        # t.string is shorthand

        t.string "email", :default => '', :null => false
        t.string "password", :limit => 40
        
        t.timestamps
        # t.timestamps creates the following two columns
        # t.datetime "created_at"
        # t.datetime "updated_at"

        # id's are added automatically. Can disable if not wanted.
    end
  end

  def down
    drop_table :users
  end
end
