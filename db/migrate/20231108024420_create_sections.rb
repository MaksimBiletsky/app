class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.references :to_do_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
