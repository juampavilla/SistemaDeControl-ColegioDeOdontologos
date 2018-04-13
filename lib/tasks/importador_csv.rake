namespace :importador_csv do
  require 'csv'

  desc 'Importa desde un csv apropiado a la base de datos'

  task importar_profesionales: :environment do
    # t.string "apellido"
    # t.string "nombres"
    # t.date "fecha_nacimiento"
    # t.string "tipo_doc"
    # t.integer "nro_doc"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.integer "user_id"
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true, :quote_char => '\'', :col_sep => ';')
    csv.each do |row|
      unless (row['APELLIDO Y NOMBRES'].nil? || row['APELLIDO Y NOMBRES'].empty?)
        apellido = row['APELLIDO Y NOMBRES'].split(' ', 2)[0].strip
        nombres = row['APELLIDO Y NOMBRES'].split(' ', 2)[1].strip
        fecha_nacimiento = row['F. DE NAC.']
        tipo_doc = row['TIPO']
        nro_doc = row['DOC. DE IDENT.']
        row_to_hash = {apellido: apellido,
          nombres: nombres,
          fecha_nacimiento: fecha_nacimiento,
          tipo_doc: tipo_doc,
          nro_doc: nro_doc}
        p "creando #{row['APELLIDO Y NOMBRES']}"
        Profesional.create(row_to_hash.select { |key, value| Profesional.method_defined?(key) })
      end
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
      unless (row['APELLIDO Y NOMBRES'].nil? || row['APELLIDO Y NOMBRES'].empty?)
        apellido = row['APELLIDO Y NOMBRES'].split(' ', 2)[0].strip
        nombres = row['APELLIDO Y NOMBRES'].split(' ', 2)[1].strip
        profesional = Profesional.where(apellido: apellido, nombres: nombres).first
        if profesional
          profesional_id = profesional.id
          cp = row['CP']
          localidad = row['LOCALIDAD']
          telefono = row['TELEFONO']
          domicilio = row['DOMICILIO PROFESIONAL']

          Domicilio.create(cp: cp, localidad: localidad, telefono: telefono, domicilio: domicilio, profesional_id: profesional_id)
          ['DOMICILIO ESPECIAL', 'OTRO DOM. PROFESIONAL', 'DOMICILIO REAL'].each do |dom|
            Domicilio.create(cp: cp, localidad: localidad, domicilio: row[dom], tipo: dom, profesional_id: profesional_id) unless row[dom].nil? || row[dom].empty?
          end
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
      unless (row['APELLIDO Y NOMBRES'].nil? || row['APELLIDO Y NOMBRES'].empty?)
        apellido = row['APELLIDO Y NOMBRES'].split(' ', 2)[0].strip
        nombres = row['APELLIDO Y NOMBRES'].split(' ', 2)[1].strip
        profesional = Profesional.where(apellido: apellido, nombres: nombres).first
        if profesional
          row_to_hash = {profesional_id: profesional.id,
            estado: row['ACTIVO'],
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

  task importar_pagos: :environment do
    # t.money "monto_abonado", scale: 2
    # t.date "fecha_pago"
    # t.integer "nro_recibo"
    # t.integer "profesional_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true, :quote_char => '\'', :col_sep => ';')
    csv.each do |row|
      unless (row['PROFESIONAL'].nil? || row['PROFESIONAL'].empty?)
        apellido = row['PROFESIONAL'].split(' ', 2)[0].strip
        nombres = row['PROFESIONAL'].split(' ', 2)[1].strip
        profesional = Profesional.where(apellido: apellido, nombres: nombres).first
        if profesional
          row_to_hash = {profesional_id: profesional.id,
            monto_abonado: row['MONTO ABONADO'],
            fecha_pago: row['FECHA'],
            nro_recibo: row['N RECIBO']}
          Pago.create(row_to_hash)
        else
          p "Profesional no encontrado para registrar pago #{row['PROFESIONAL']}"
        end
      end
    end
  end
end
