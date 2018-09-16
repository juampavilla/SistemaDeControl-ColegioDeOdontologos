class ChangeProfesianlNulleableIdInUser1 < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column_null(:users, :profesional_id, false)
    end

    def down
      change_column_null(:users, :profesional_id, true)
    end
  end
end
