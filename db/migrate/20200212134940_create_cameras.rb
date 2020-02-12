class CreateCameras < ActiveRecord::Migration[6.0]
  def change
    create_table :cameras do |t|
      t.string :latitude
      t.string :longitude
      t.string :ip
      t.string :name

      t.timestamps
    end
  end
end
