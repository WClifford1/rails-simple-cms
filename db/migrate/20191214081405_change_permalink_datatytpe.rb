class ChangePermalinkDatatytpe < ActiveRecord::Migration[5.2]
  def up
    change_column("pages", "permalink", :string)
  end

  def down
    change_column("pages", "permalink", :integer)
  end
end
