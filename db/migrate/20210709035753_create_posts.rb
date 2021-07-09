class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :email
      t.string :postmemo
      t.string :start_at
      t.string :stop_at
      t.string :allday

      t.timestamps
    end
  end
end
