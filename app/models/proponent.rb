class Proponent < ApplicationRecord
  validates :nome, :cpf, :salario, presence: true
  validates :cpf, cpf: true
  validates :cpf, uniqueness: { case_sensitive: false, on: :create, message: 'já está cadastrado' }
end
