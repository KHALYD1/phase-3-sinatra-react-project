class CreateNewtsk < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.timestamps
  end
end
end

