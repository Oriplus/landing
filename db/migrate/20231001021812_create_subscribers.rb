class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.string :email, index: { unique: true, name: 'unique_emails' }

      t.timestamps
    end
  end
end
