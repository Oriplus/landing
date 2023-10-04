class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.string :key_name

      t.timestamps
    end
  end
end
