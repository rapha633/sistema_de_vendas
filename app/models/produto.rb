class Produto < ApplicationRecord
  has_many :itens_venda, class_name: 'ItemVenda'

  def quantidade_estoque
    estoque - itens_venda.sum(:quantidade)
  end
end
def atualizar_estoque(quantidade)
  self.estoque += quantidade
  self.save
end
