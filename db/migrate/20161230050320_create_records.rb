class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :date
      t.string :morning
      t.string :afternoon
      t.string :evening
      t.string :night
      t.string :sleep
      t.string :water
      t.string :exercise
      t.string :bath
      t.string :health
      t.string :read
      t.string :place
      t.string :comments
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
