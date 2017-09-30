class Profesional < ApplicationRecord
  has_one :matricula
  has_many :domicilios

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
end
