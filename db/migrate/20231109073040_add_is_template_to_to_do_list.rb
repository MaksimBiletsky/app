class AddIsTemplateToToDoList < ActiveRecord::Migration[7.0]
  def change
    add_column :to_do_lists, :is_template, :boolean, default: false
  end
end
