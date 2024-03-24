class CreateProponents < ActiveRecord::Migration[7.1]
  def change
    create_table :proponents do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nascimento
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :telefone_pessoal
      t.string :telefone_referencias
      t.string :salario
      t.string :valor_desconto
      t.timestamps
    end
  end
end
