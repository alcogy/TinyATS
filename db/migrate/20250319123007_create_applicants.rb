class CreateApplicants < ActiveRecord::Migration[8.0]
  def change
    create_table :applicants do |t|
      t.string  :name
      t.integer :status
      t.timestamps
    end
  end
end
