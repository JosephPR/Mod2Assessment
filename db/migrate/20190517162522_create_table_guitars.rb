class CreateTableGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :name
      t.string :body
    end
  end
end
