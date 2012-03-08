class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :name
      t.timestamps
    end
  end
end
