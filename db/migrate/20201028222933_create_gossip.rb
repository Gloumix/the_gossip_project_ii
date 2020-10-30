class CreateGossip < ActiveRecord::Migration[6.0]
  def change
    create_table :gossips do |t|
      t.string :content
      t.string :title
      t.belongs_to :user, index=true
      t.timestamps
    end
  end
end
