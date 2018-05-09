class Pago < ApplicationRecord
  belongs_to :profesional
  validates_inclusion_of :concepto, in: Choices['concepto']

  include ReportsKit::Model
  reports_kit do
    aggregation :monto , :monto_abonado
     #contextual_filter :for_profesional, ->(relation, context_params) { relation.where(profesional_id: context_params[:profesional_id]) }
     #contextual_filter :for_profesional, ->(relation, pago_params) { relation.where.not(profesional_id: nil) }
  #  filter :is_published, :boolean, conditions: ->(relation) { relation.where(status: 'published') }contextual_filter :for_author, ->(relation, context_params) { relation.where(author_id: context_params[:author_id]) }
  end

end
