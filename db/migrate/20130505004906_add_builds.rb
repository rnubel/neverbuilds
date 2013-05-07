class AddBuilds < ActiveRecord::Migration
  def up
    create_table :builds do |t|
      t.string :name
      t.text :body
      t.string :category
      t.string :class 
      t.string :video
      t.string :type
      t.references :user
      t.timestamps 
    end 
  end

  def down
    drop_table :builds
  end
end
