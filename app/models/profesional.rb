class Profesional < ApplicationRecord
  has_one :matricula
  has_many :domicilio

  def self.search(termino_buscado, attributes)
    if termino_buscado && attributes
      results = []
      attributes.each do |att|
        results = results.empty? ? (Profesional.joins(:matricula).joins(:domicilio).where("#{att} LIKE ?", "%#{termino_buscado}%")) : results + Profesional.joins(:matricula).joins(:domicilio).where("#{att} LIKE ?", "%#{termino_buscado}%")
      end
      results.uniq
    else
      all
    end
  end
end
