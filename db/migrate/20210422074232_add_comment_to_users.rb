class AddCommentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :comment, :string
  end
end
