# spec/workers/salary_update_worker_spec.rb
require 'rails_helper'

RSpec.describe SalaryUpdateWorker, type: :worker do
  describe '#perform' do
    let(:proponent) { create(:proponent, salario: 1000) }

    context 'when proponent exists' do
      it 'updates the proponent salary' do
        new_salary = 1500
        expect {
          subject.perform(proponent.id, new_salary)
          proponent.reload
        }.to change(proponent, :salario).to(new_salary)
      end
    end

    context 'when proponent does not exist' do
      it 'does not update any proponent' do
        expect {
          subject.perform(-1, 1500)
        }.not_to change(Proponent, :count)
      end
    end
  end
end
