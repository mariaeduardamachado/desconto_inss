# app/workers/update_salary_worker.rb
class UpdateSalaryWorker
  include Sidekiq::Worker

  def perform(proponent_id, new_salary)
    proponent = Proponent.find_by(id: proponent_id)
    return unless proponent

    proponent.update(salario: new_salary)
  end
end
