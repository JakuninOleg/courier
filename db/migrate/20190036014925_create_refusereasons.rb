class CreateRefusereasons < ActiveRecord::Migration[5.2]
  def change
    create_table :refusereasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
