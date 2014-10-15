class CreateWordAnswers < ActiveRecord::Migration
  def change
    create_table :word_answers do |t|
      t.string :content
      t.references :word, index: true
      t.boolean :correct

      t.timestamps
    end
  end
end
