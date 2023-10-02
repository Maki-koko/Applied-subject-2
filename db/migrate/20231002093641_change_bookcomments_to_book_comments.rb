class ChangeBookcommentsToBookComments < ActiveRecord::Migration[6.1]
  def change
    rename_table :bookcomments, :book_comments
  end
end
