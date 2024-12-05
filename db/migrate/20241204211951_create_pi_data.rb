class CreatePiData < ActiveRecord::Migration[7.2]
  def change
    create_table :pi_data do |t|
      t.string :color
      t.float :temperature
      t.float :pressure

      t.timestamps
    end
  end
end
