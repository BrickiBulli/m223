class AddRoleToEmployees < ActiveRecord::Migration[7.2]
  def change
    add_column :employees, :role, :string
  end
end
