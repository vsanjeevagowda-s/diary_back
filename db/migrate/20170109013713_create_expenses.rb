class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :product
      t.float :got
      t.float :spent
      t.float :change
      t.string :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
