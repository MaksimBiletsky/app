class AddUserToToDoList < ActiveRecord::Migration[7.0]
  def change
    add_reference :to_do_lists, :user, null: false, foreign_key: true
  end
end
