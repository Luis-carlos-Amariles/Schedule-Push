class AddFieldDocumentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :document, :integer
    add_column :users, :token_pass, :string
  end
end
