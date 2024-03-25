class Proponent < ApplicationRecord
  validates :nome, :cpf, :salario, presence: true
  validates :cpf, cpf: true
end
