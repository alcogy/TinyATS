class Schedule < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.integer :applicant_id
      t.string :remark
      t.timestamps
    end
  end
end
