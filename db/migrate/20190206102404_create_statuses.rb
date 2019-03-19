class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :general
      t.string :courier
      t.string :authorizer
      t.string :supervisor

      t.timestamps
    end
  end
end
