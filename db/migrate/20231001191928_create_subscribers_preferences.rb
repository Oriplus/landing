class CreateSubscribersPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers_preferences do |t|
      t.references :subscriber, null: false, foreign_key: true
      t.references :preference, null: false, foreign_key: true

      t.timestamps
    end
  end
end
