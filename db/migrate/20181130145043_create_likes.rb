class CreateLikes < ActiveRecord::Migration[5.2]
  def change
      	create_table :likes do |t|
			t.text :ip_adress
			t.text :id_comment
			t.text :id_mess
			t.boolean :like
			t.boolean :dislike

			t.timestamps
		end
  end
end
