class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |table|
        table.column(:name,:string, :limit=>20)
        table.column(:category,:string, :limit=>20)
        table.column(:gender,:string, :limit=>20)
        table.timestamps()
    end
  end
end
