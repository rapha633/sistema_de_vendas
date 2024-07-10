class ClientesController < ApplicationController
  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to root_path, notice: 'Cliente cadastrado com sucesso!'
    else
      render :new
    end
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nome, :email, :telefone)
  end
end
class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def show
    @cliente = Cliente.find(params[:id])
  end
end
