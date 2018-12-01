class CreateComments < ActiveRecord::Migration[5.2]
  def change
      	create_table :comments do |t|
			t.text :id_mess
			t.text :comment
			t.text :ip_adress
			t.timestamps
		end
  end
end
