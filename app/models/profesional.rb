class Profesional < ApplicationRecord
  require 'csv'

  has_one :matricula
  has_many :domicilios
  has_one :user

  accepts_nested_attributes_for :domicilios
  accepts_nested_attributes_for :matricula

  def self.search(termino_buscado, attributes)
    if termino_buscado && attributes
      results = []
      attributes.each do |att|
        results = results.empty? ? (Profesional.joins(:matricula).joins(:domicilios).where("#{att} LIKE ?", "%#{termino_buscado}%")) : results + Profesional.joins(:matricula).joins(:domicilios).where("#{att} LIKE ?", "%#{termino_buscado}%")
      end
      results.uniq
    else
      all
    end
  end

  def self.to_csv profesionales
    attributes = %w{apellido nombres fecha_nacimiento tipo_doc nro_doc}
    matricula_attributes = %w{estado matricula fecha_inscripcion libro folio fecha_habilitacion nota_fecha_habilitacion vencimiento especialidad fecha_vencimiento notas}
    headers = ["Apellido", "Nombres", "Fecha Nacimiento", "Tipo Doc", "Nro Doc", "Estado Matricula", "Matricula", "Fecha Inscripcion", "Libro", "Folio", "Fecha Habilitacion", "Nota Fecha Habilitacion", "Vencimiento", "Especialidad", "Fecha Vencimiento", "Notas Matricula"]

    CSV.generate(headers: true, col_sep: ";") do |csv|
      csv << headers

      profesionales.each do |profesional|
        profesional_data = attributes.map{ |attr| profesional.send(attr) }
        matricula_data = matricula_attributes.map{ |attr| profesional.matricula.send(attr) }
        csv << profesional_data + matricula_data
      end
    end
  end
end
