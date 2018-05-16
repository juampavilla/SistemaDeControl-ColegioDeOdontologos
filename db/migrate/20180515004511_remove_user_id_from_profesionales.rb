class RemoveUserIdFromProfesionales < ActiveRecord::Migration[5.1]
  def change
    remove_column :profesionales, :user_id, :integer
  end
end
