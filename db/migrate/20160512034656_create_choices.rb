class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :student, foreign_key: true
      t.integer :preference
      t.belongs_to :programme, index: true, foreign_key: true
      t.float :index_mark, default: 0
      t.integer :rank, default: 0
      t.string :status, default: "WL"
      t.string :general, default: "WL"
      t.string :sc, default: "WL"
      t.string :st, default: "WL"
      t.string :muslim, default: "WL"
      t.string :handicapped, default: "WL"
      t.string :obc, default: "WL"
      t.string :obh, default: "WL"
      t.string :etb, default: "WL"
      t.string :latin, default: "WL"
      t.boolean :disabled, default: false

      t.timestamps null: false
    end
  end
end
