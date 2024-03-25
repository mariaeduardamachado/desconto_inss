# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "user@user.com", password: "123456")
puts "Usuário criado com sucesso"

Proponent.create(nome: "Fernando Marcelo Juan da Mota",cpf: "199.483.037-92",data_nascimento: "20/01/1992",cep: "79015-010",logradouro: "Rua Francisco de Oliveira Barbosa",numero: '323',bairro: "Jardim Campo Verde",cidade: "Campo Grande",estado: "MS",telefone_referencias: "(67) 2553-7458",telefone_pessoal: "(67) 99291-8677",salario: "1200", valor_desconto: "108")
Proponent.create(nome: "Thales Fernando Costa",cpf: "889.521.706-36",data_nascimento: "17/01/1984",cep: "68377-268",logradouro: "Travessa Nordestina",numero: 6262,bairro: "Boa Esperança",cidade: "Altamira",estado: "PA",telefone_pessoal: "(93) 2997-8150",telefone_referencias: "(93) 99892-2199",salario:"5000", valor_desconto: "700")
Proponent.create( nome: "Benjamin Kauê Oliver Barros",cpf: "920.764.359-64",data_nascimento: "01/01/1982",cep: "36305-000",logradouro: "Rua José Nogueira",numero: 611,bairro: "Vila Nossa Senhora de Fátima",cidade: "São João Del Rei",estado: "MG",telefone_pessoal: "(32) 3990-0213",telefone_referencias: "(32) 98734-2853",salario:"1900", valor_desconto: "171")
Proponent.create(nome: "Melissa Heloise Luzia Almeida",cpf: "247.733.447-68",data_nascimento: "09/01/1980",cep: "67030-425",logradouro: "Rua da Cachoeira",numero: 656,bairro: "Centro",cidade: "Ananindeua",estado: "PA",telefone_pessoal: "(91) 3631-7455",telefone_referencias: "(91) 99377-1104",salario:"3900",valor_desconto: "546")
Proponent.create(nome: "Yuri Pietro Diego Martins",cpf: "593.376.139-72",data_nascimento: "08/02/1962",cep: "57046-570",logradouro: "Avenida Eraldo Lins Cavalcante",numero: 183,bairro: "Serraria",cidade: "Maceió",estado: "AL",telefone_pessoal: "(82) 3746-4166",telefone_referencias: "(82) 99656-6117",salario:"2300",valor_desconto: "276")
Proponent.create(nome: "Thales Caio Fernandes",cpf: "545.473.496-90",data_nascimento: "27/02/1968",cep: "25645-120",logradouro: "Servidão Carlos Manuel de Macedo",numero: 663,bairro: "São Sebastião",cidade: "Petrópolis",estado: "RJ",telefone_pessoal: "(24) 2764-9451",telefone_referencias: "(24) 98749-8050",salario:"7800",valor_desconto: "0.0")
Proponent.create(nome: "Victor Diego Otávio Barros",cpf: "130.885.514-18",data_nascimento: "21/03/2002",cep: "49009-076",logradouro: "Travessa José Domingos Maia IV",numero: 701,bairro: "Zona de Expansão (Mosqueiro)",cidade: "Aracaju",estado: "SE",telefone_pessoal: "(79) 3996-5344",telefone_referencias: "(79) 99416-0491",salario:"3600",valor_desconto: "504")
Proponent.create(nome: "Fernando Henry Juan Peixoto",cpf: "746.218.513-06",data_nascimento: "04/03/1988",cep: "65047-420",logradouro: "Rua Frei José",numero: 543,bairro: "Vila Palmeira",cidade: "São Luís",estado: "MA",telefone_pessoal: "(98) 3566-2229",telefone_referencias: "(98) 99480-3230",salario:"1450",valor_desconto: "130.5")
Proponent.create(nome: "Clara Sueli Almeida",cpf: "346.088.398-70",data_nascimento: "27/02/1959",cep: "69919-606",logradouro: "Rua Hortências",numero: 267,bairro: "Jardim Primavera",cidade: "Rio Branco",estado: "AC",telefone_pessoal: "(68) 3619-8971",telefone_referencias: "(68) 99595-2046",salario:"3200",valor_desconto: "384")
Proponent.create(nome: "Marcos Vinicius Kevin da Luz",cpf: "334.095.937-48",data_nascimento: "18/02/1987",cep: "58057-275",logradouro: "Rua José Gomes Amarantes",numero: 624,bairro: "Mangabeira",cidade: "João Pessoa",estado: "PB",telefone_pessoal: "(83) 2529-5743",telefone_referencias: "(83) 98778-3057", salario:"8000",valor_desconto: "0.0")
Proponent.create(nome: "Tatiane Carolina Sebastiana Nogueira",cpf: "471.883.574-71",data_nascimento: "01/03/1972",cep: "69906-268",logradouro: "Travessa Assis",numero: 996,bairro: "Triângulo Novo",cidade: "Rio Branco",estado: "AC",telefone_pessoal: "(68) 2897-3628",telefone_referencias: "(68) 99580-8176",salario:"6500",valor_desconto: "0.0")
Proponent.create(nome: "Carolina Rita Lorena Novaes",cpf: "027.132.012-50",data_nascimento: "26/01/1982",cep: "64055-390",logradouro: "Rua Maria Quitéria",numero: 756,bairro: "Piçarreira",cidade: "Teresina",estado: "PI",telefone_pessoal: "(86) 3597-4911",telefone_referencias: "(86) 99613-2881",salario:"1085",valor_desconto: "81,37")

puts "criado com sucesso"