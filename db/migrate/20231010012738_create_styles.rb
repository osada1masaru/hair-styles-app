class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|
      t.string :name
      t.text :menu
      t.text :detail
      t.text :deta
      t.string :image

      t.timestamps
    end
  end
end
