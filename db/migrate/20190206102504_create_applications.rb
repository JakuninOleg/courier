class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.timestamps
      t.string :name
      t.string :phone
      t.string :address
      t.string :card
      t.string :sputnikid
      t.date :time
      t.references :status, foreign_key: true, index: true
      t.references :refusereason, foreign_key: true, index: true
      t.references :rejectreason, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.references :region, foreign_key: true, index: true
      t.references :timeslot, foreign_key: true, index: true
    end
  end
end
