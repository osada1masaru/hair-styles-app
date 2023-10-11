class AddUserIdToStyles < ActiveRecord::Migration[6.1]
  def change
    add_reference :styles, :user, null: false, foreign_key: true
  end
end
