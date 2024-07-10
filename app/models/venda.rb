class Venda < ApplicationRecord
  belongs_to :cliente
  has_many :itens_venda, class_name: 'ItemVenda', dependent: :destroy
  accepts_nested_attributes_for :itens_venda, allow_destroy: true
end
