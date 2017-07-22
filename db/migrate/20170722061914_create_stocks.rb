class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table(:stocks) do |t|
        t.column(:brand_id, :int)
        t.column(:store_id, :int)
    end
  end
end
