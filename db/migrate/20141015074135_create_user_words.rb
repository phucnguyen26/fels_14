class CreateUserWords < ActiveRecord::Migration
  def change
    create_table :user_words do |t|
      t.references :user, index: true
      t.references :word, index: true
      t.string :answer
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
