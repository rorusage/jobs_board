class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_class
      t.string :job_type
      t.string :company
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
