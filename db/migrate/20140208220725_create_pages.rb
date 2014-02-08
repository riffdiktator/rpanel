class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text
      t.boolean :in_menu

      t.timestamps
    end
  end
end
