class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.integer :user_id
      t.string :content
      t.timestamps
    end
  end
end
