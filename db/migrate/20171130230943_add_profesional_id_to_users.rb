class AddProfesionalIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profesional_id, :integer
  end
end
