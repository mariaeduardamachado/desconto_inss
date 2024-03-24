class Proponent < ApplicationRecord
  validates :name, :cpf, :salario, presence: true
  validates :cpf, cpf: true
end
