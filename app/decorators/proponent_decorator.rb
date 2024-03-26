class ProponentDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper

  delegate_all

  def cpf
    object.cpf.insert(3, '.').insert(7, '.').insert(11, '-')
  end

  def data_nascimento
    object&.data_nascimento&.strftime("%d/%m/%Y")
  end

  def endereco
    "#{object.logradouro}-#{object.cidade}"
  end

  def salario
    number_to_currency(object.salario, unit: 'R$', separator: ',', delimiter: '.')
  end

  def valor_desconto
    number_to_currency(object&.valor_desconto, unit: 'R$', separator: ',', delimiter: '.')
  end
end
