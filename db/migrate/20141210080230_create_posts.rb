class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # by default, it already has ID
      # ID is an integer / number
      # t.data_type :column_name
      # string is just text
      # title = "Batman is HIHI"
      # url = "http://www.batman.hihi"

      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
