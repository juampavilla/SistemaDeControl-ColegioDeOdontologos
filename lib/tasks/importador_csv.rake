namespace :importador_csv do
  require 'csv'

  desc 'Importa desde un csv apropiado a la base de datos'

  task importar_profesionales: :environment do
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true)
    csv.each do |row|
      Profesional.create(row.to_hash)
    end
  end

  task importar_domicilios: :environment do
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true)
    csv.each do |row|
      Domicilio.create(row.to_hash)
    end
  end

  task importar_matriculas: :environment do
    ruta_csv = ENV['archivo_csv']
    archivo_csv = File.read(ruta_csv)
    csv = CSV.parse(archivo_csv, :headers => true)
    csv.each do |row|
      Matricula.create(row.to_hash)
    end
  end
end
