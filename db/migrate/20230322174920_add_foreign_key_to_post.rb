class AddForeignKeyToPost < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, validate: false
  end
end

class ValidateAddForeignKeyToPost < ActiveRecord::Migration[7.0]
  def change
    validate_foreign_key :posts, :users
  end
end

