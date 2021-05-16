class AddAgeTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :animal_type, :string
  end
end
