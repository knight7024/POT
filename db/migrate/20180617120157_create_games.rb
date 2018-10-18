class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
	  t.string :koname
	  t.string :enname
	  t.string :company
	  t.string :picurl_300
	  t.string :picurl_blur
      t.timestamps
    end
  end
end
