class CreateRejectreasons < ActiveRecord::Migration[5.2]
  def change
    create_table :rejectreasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
