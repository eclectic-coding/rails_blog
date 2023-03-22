class AddUserToPost < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_reference :posts, :user, index: {algorithm: :concurrently}
  end
end
