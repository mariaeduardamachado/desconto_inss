# Description/Explanation of Person class
class ProponentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update_salary
  before_action :set_proponent_params, only: %i[show edit update destroy update_salary]

  def index
    @proponents = Proponent.all.page(params[:page]).per(5).order(:id)
  end

  def new
    @proponent = Proponent.new
  end

  def create
    @proponent = Proponent.create(proponent_params)
    if @proponent.valid?
      @calulo_inss = CalculoInss::CalculoInssService.run(proponent_params,params)
      flash[:errors] = 'Proponente Created Successfully'
      redirect_to proponents_path
    else
      flash[:errors] = @proponent.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @proponent.update(proponent_params)
      flash[:errors] = 'Proponente Updated Successfully'
      redirect_to proponents_path
    else
      flash[:errors] = @proponent.errors.full_messages
      redirect_to edit_proponent_path
    end
  end

  def destroy
    if @proponent.delete
      flash[:errors] = 'Proponente Deletado com Successfully'
      redirect_to root_path(@proponent)
    else
      flash[:errors] = @proponent.errors.full_messages
      redirect_to destroy_proponent_path
    end
  end

  def report
    faixas_salariais = [
    { faixa: 'Até R$ 1.045,00', min: 0, max: 1045 },
    { faixa: 'De R$ 1.045,01 a R$ 2.089,60', min: 1045.01, max: 2089.6 },
    { faixa: 'De R$ 2.089,61 até R$ 3.134,40', min: 2089.61, max: 3134.4 },
    { faixa: 'De R$ 3.134,41 até R$ 6.101,06', min: 3134.41, max: 6101.06 }
    ]

    @contagem_por_faixa = {}
    faixas_salariais.each do |faixa|
      @contagem_por_faixa[faixa[:faixa]] = Proponent.where(salario: faixa[:min]..faixa[:max]).count
    end
  end

  def update_salary
    new_salary = params[:proponent][:salario].to_f

    UpdateSalaryWorker.perform_async(@proponent.id, new_salary)
    @calulo_inss = CalculoInss::CalculoInssService.run(proponent_params,params)

    redirect_to proponents_path, notice: 'Salário atualizado com sucesso.'
  end

  private

  def set_proponent_params
    @proponent = Proponent.find(params[:id])
  end

  def proponent_params
    params.require(:proponent).permit(:nome, :cpf, :data_nascimento, :logradouro, :numero, :bairro, :cidade, :estado, :cep,
                                      :telefone_pessoal, :telefone_referencias, :salario, :valor_desconto)
  end
end
