# Description/Explanation of Person class
class ProponentsController < ApplicationController
  before_action :set_proponent_params, only: %i[show edit update destroy]
  def index
    @proponents = Proponent.all.page(params[:page]).per(5)
  end

  def new
    @proponent = Proponent.new
  end

  def salary_report
    @proponents = Proponent.all
  end

  def create
    @calulo_inss = CalculoInss::CalculoInssService.run(proponent_params, current_user)

    @proponent = Proponent.create(proponent_params)
    if @proponent.valid?
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
      redirect_to proponent_path(@proponent)
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

  private

  def set_proponent_params
    @proponent = Proponent.find(params[:id])
  end

  def proponent_params
    params.require(:proponent).permit(:nome, :cpf, :data_nascimento, :logradouro, :numero, :bairro, :cidade, :estado, :cep,
                                      :telefone_pessoal, :telefone_referencias, :salario, :valor_desconto)
  end
end
