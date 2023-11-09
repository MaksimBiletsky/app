class AddPositionToToDoList < ActiveRecord::Migration[7.0]
  def change
    add_column :to_do_lists, :position, :integer
  end
end
