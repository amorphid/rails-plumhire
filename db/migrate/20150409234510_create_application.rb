class CreateApplication < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :job_id
      t.string :email
      t.string :name
      t.string :phone
    end
  end
end
