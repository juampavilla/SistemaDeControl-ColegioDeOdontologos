namespace :importador_csv do
  require 'csv'

  desc 'Importa desde un csv apropiado a la base de datos'

  task importar_profesionales: :environment do
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true, :quote_char => '\'', :col_sep => ';')
    csv.each do |row|
      Profesional.create(row.to_hash.select { |key, value| Profesional.method_defined?(key) })
    end
  end

  task importar_domicilios: :environment do
    # t.string "cp"
    # t.string "localidad"
    # t.string "domicilio"
    # t.string "telefono"
    # t.string "tipo"
    # t.text "notas"
    # t.integer "profesional_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true, :quote_char => '\'', :col_sep => ';')
    csv.each do |row|
      profesional = Profesional.where(apellido: row['apellido'], nombres: row['nombres']).first
      if profesional
        profesional_id = profesional.id
        cp = row['cp']
        localidad = row['localidad']
        telefono = row['telefono']
        domicilio = row['domicilio_profesional']

        Domicilio.create(cp: cp, localidad: localidad, telefono: telefono, domicilio: domicilio, profesional_id: profesional_id)
        ['domicilio_especial', 'domicilio_profesional_2', 'domicilio_real'].each do |dom|
          Domicilio.create(cp: cp, localidad: localidad, domicilio: row[dom], tipo: dom, profesional_id: profesional_id) unless row[dom].nil? || row[dom].empty?
        end
      end
    end
  end

  task importar_matriculas: :environment do
    # t.string "estado"
    # t.string "matricula"
    # t.date "fecha_inscripcion"
    # t.string "libro"
    # t.integer "folio"
    # t.date "fecha_habilitacion"
    # t.string "nota_fecha_habilitacion"
    # t.integer "vencimiento"
    # t.string "especialidad"
    # t.date "fecha_vencimiento"
    # t.integer "profesional_id"
    # t.text "notas"
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true, :quote_char => '\'', :col_sep => ';')
    csv.each do |row|
      profesional = Profesional.where(apellido: row['apellido'], nombres: row['nombres']).first
      if profesional
        row_to_hash = {profesional_id: profesional.id,
          estado: row['estado'],
          matricula: row['MATRICULA'],
          fecha_inscripcion: row['F. DE INSC.'],
          libro: row['LIBRO'],
          folio: row['FOLIO'],
          fecha_habilitacion: row['F.HABILIT.'],
          vencimiento: row['VENCIMIENTO'],
          especialidad: row['ESPECIALIDAD'],
          fecha_vencimiento: row['FECHA VENCIM.']}
        Matricula.create(row_to_hash)
      end
    end
  end
end
