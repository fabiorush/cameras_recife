class CreateUserCameras < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cameras do |t|
      t.references :user, null: false, foreign_key: true
      t.references :camera, null: false, foreign_key: true

      t.timestamps
    end
  end
end
