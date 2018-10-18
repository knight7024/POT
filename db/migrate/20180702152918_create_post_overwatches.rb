class CreatePostOverwatches < ActiveRecord::Migration[5.0]
  def change
    create_table :post_overwatches do |t|
	  t.references :game, index: true, foreign_key: true
	  t.string :title, null: false
      t.string :game_mode, null: false
      t.string :role, null: false
      t.string :tier, null: true
      t.datetime :play_date, null: false
	  t.string :use_mic, null: false
	  t.string :battletag, null: false
	  t.string :comment, null: false
	  t.integer :now_member, null: false, default: 0
	  t.integer :all_member, null: false
	  t.integer :user_id, null: false
	  t.string :ip_address, null: false
      t.timestamps
    end
  end
end
