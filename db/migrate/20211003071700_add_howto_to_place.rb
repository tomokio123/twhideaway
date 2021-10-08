class AddHowtoToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :howto, :text
  end
end
