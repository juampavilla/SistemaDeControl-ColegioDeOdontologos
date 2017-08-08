class CreateProfesionales < ActiveRecord::Migration[5.0]
  def change
    create_table :profesionales do |t|
      t.string :apellido
      t.string :nombres
      t.date :fecha_nacimiento
      t.string :tipo_doc
      t.integer :nro_doc

      t.timestamps
    end
  end
end
