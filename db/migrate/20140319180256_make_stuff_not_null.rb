class MakeStuffNotNull < ActiveRecord::Migration
  def change
    change_column :employees, :first_name, :string, null: false
  end

end
