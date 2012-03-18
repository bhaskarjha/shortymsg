class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end

class AddColumnToUsers < ActiveRecord::Migration
    def up
        Add_column :email,:phone
    end
    def down
        remove_column :phone
    end
end
