class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.belongs_to :team
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
