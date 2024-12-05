class AddDeviceNameToPiData < ActiveRecord::Migration[7.2]
  def change
    add_column :pi_data, :device_name, :string
  end
end
