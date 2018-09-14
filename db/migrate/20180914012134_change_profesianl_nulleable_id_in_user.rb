class ChangeProfesianlNulleableIdInUser < ActiveRecord::Migration[5.1]
  def up
    change_column_null(:users, :profesional_id, true)
  end

  def down
    change_column_null(:users, :profesional_id, false)
  end
end
