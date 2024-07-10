class CreateItemVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :item_vendas do |t|
      t.references :venda, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
