class CreateGarbageManuals < ActiveRecord::Migration[5.2]
  def change
    create_table :garbage_manuals do |t|
      t.string :address
      t.string :recyclable_day_of_the_week
      t.string :burnable_day_of_the_week01
      t.string :burnable_day_of_the_week02
      t.string :non_burnable_day_of_the_week01
      t.string :non_burnable_day_of_the_week02
    end
  end
end
