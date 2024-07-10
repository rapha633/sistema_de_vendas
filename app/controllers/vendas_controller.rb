class VendasController < ApplicationController
  class VendasController < ApplicationController
    def index
      @vendas = Venda.all
    end
  def create
    @venda = Venda.new(venda_params)
    if @venda.save
      @venda.itens_venda.each do |item_venda|
        produto = item_venda.produto
        produto.atualizar_estoque(-item_venda.quantidade) # Debita o estoque
      end
      redirect_to @venda, notice: 'Venda criada com sucesso.'
    else
      render :new
    end
  end

  def destroy
    @venda = Venda.find(params[:id])
    # Reverte o estoque dos produtos vendidos
    @venda.itens_venda.each do |item_venda|
      produto = item_venda.produto
      produto.atualizar_estoque(item_venda.quantidade) # Adiciona ao estoque
    end
    @venda.destroy
    redirect_to vendas_path, notice: 'Venda cancelada com sucesso.'
  end

  private

  def venda_params
    params.require(:venda).permit(:cliente_id, itens_venda_attributes: [:produto_id, :quantidade])
  end
end
end
class VendasController < ApplicationController
  def new
    @venda = Venda.new
    @venda.itens_venda.build
  end
end
