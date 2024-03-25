# spec/services/calculo_inss_service_spec.rb
require 'rails_helper'

RSpec.describe CalculoInssService do
  describe '.run' do
    let(:user) { create(:user) }
    let(:proponent_params) { { 'salario' => 2000 } }

    context 'when proponent has a salary within a range' do
      it 'updates the proponent with the correct discount value' do
        proponent = create(:proponent)
        allow(Proponent).to receive(:last).and_return(proponent)

        described_class.run(proponent_params, user)

        expect(proponent.reload.valor_desconto).to eq(2000 * 0.09)
      end
    end

    context 'when proponent has a salary outside of any range' do
      it 'updates the proponent with zero discount value' do
        proponent = create(:proponent)
        allow(Proponent).to receive(:last).and_return(proponent)

        proponent_params['salario'] = 7000

        described_class.run(proponent_params, user)

        expect(proponent.reload.valor_desconto).to eq(0.0)
      end
    end
  end
end
