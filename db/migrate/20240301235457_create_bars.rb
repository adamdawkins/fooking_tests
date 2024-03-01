class CreateBars < ActiveRecord::Migration[6.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.belongs_to :foo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
