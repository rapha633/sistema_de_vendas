class AddQuantidadeEstoqueToProdutos < ActiveRecord::Migration[7.1]
  def change
    add_column :produtos, :quantidade_estoque, :integer
  end
end
