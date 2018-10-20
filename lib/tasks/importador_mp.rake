namespace :importador_mp do
  task importar: :environment do
    require 'mercadopago.rb'
    $mp = MercadoPago.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])

    searchResult = $mp.search_payment({}, 0, 1000)

    searchResult['response']['results'].each do |pago|
      mat = pago['description'].split(' ')[2] if (pago['description'] && (pago['description'].split(' ').count > 2) && (pago['description'].split(' ')[0] == 'Pago') && (pago['description'].split(' ')[1] == 'matricula'))

      matricula = Matricula.where(matricula: mat).take
      if matricula
        p "matricula #{matricula.matricula} a ser actualizada..."
        profesional = matricula.profesional
        p "profesional #{profesional.nombres} #{profesional.apellido}"

        existing_pago = profesional.pagos.where(mp_id: pago['id']).take
        if existing_pago
          p "pago existente con estado #{existing_pago.status}"
          existing_pago.update_attribute(:status, pago['status'])
          p "pago con estado actualizado a #{existing_pago.status}"
        else
          nuevo_pago = profesional.pagos.create(monto_abonado: pago['transaction_amount'].to_f,
                                  fecha_pago: pago['date_created'],
                                  nro_recibo: pago['id'],
                                  cuota_anio: '2018',
                                  concepto: Choices['concepto'][0],
                                  status: pago['status'],
                                  mp_id: pago['id'])
          p "pago no existente, creando #{nuevo_pago.mp_id}"
        end
      else
        p "matricula #{mat} no encontrada."
      end
      p "-------------"
    end
  end
end
