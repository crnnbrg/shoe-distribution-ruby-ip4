class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |table|
        table.column(:name,:varchar, :limit=>50)
        table.column(:address,:varchar, :limit=>50)
        table.column(:telephone,:varchar, :limit=>20)
        table.column(:country,:varchar, :limit=>20)
        table.timestamps()
    end
  end
end
