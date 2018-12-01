class CreateMessages < ActiveRecord::Migration[5.2]
  def change
      	create_table :messages do |t|
			t.text :title
			t.text :mess
			t.text :ip_adress

			t.timestamps
		end
  end
end
