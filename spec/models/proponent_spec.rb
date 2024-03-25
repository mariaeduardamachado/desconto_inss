require 'rails_helper'

RSpec.describe Propoente, type: :model do
  it "é válido com todos os atributos presentes" do
    propoente = Propoente.new(
      nome: "Fulano",
      cpf: "12345678900",
      salario: 2000.00
    )
    expect(propoente).to be_valid
  end

  it "é inválido sem o atributo nome" do
    propoente = Propoente.new(nome: nil, cpf: "12345678900", salario: 2000.00)
    propoente.valid?
    expect(propoente.errors[:nome]).to include("não pode ficar em branco")
  end

  it "é inválido sem o atributo cpf" do
    propoente = Propoente.new(nome: "Fulano", cpf: nil, salario: 2000.00)
    propoente.valid?
    expect(propoente.errors[:cpf]).to include("não pode ficar em branco")
  end

  it "é inválido sem o atributo salario" do
    propoente = Propoente.new(nome: "Fulano", cpf: "12345678900", salario: nil)
    propoente.valid?
    expect(propoente.errors[:salario]).to include("não pode ficar em branco")
  end
end