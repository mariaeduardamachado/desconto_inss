module CalculoInss
  # Description/Explanation of Person class
  class CalculoInssService
    attr_reader :proponent_params

    def self.run(proponent_params, current_user = User.find(User::DEFAULT_ID))
      new(proponent_params, current_user).run
    end

    def initialize(proponent_params, current_user)
      @salario = proponent_params['salario'].to_f
      @proponent_params = proponent_params
      @proponent = Proponent.last
    end

    def run
      calcular_inss
    end

    private

    def calcular_inss
      # Definir as faixas de contribuição e as taxas correspondentes
      faixas = [
        { faixa: (0..1100), aliquota: 0.075 },
        { faixa: (1100.01..2203.48), aliquota: 0.09 },
        { faixa: (2203.49..3305.22), aliquota: 0.12 },
        { faixa: (3305.23..6433.57), aliquota: 0.14 }
      ]

      # Encontrar a faixa de contribuição correspondente ao salário
      faixa_contribuicao = faixas.find { |faixa| faixa[:faixa].include?(@salario) }

      if faixa_contribuicao
        # Calcular o INSS usando a aliquota correspondente
        inss =  @salario * faixa_contribuicao[:aliquota]
        @proponent.update(valor_desconto:inss)
      else
        @proponent.update(valor_desconto:"0.0")
      end
    end
  end
end
