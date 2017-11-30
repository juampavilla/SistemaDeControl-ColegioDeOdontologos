class AddUserIdToProfesionales < ActiveRecord::Migration[5.1]
  def change
    add_column :profesionales, :user_id, :integer
  end
end
