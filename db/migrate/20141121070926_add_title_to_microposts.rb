class AddTitleToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :title, :text, null: false

  end
end
