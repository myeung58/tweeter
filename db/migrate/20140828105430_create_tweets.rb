class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content, {limit: 140}
      t.boolean :retweet, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
