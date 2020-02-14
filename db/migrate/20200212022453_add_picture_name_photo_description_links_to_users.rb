class AddPictureNamePhotoDescriptionLinksToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :users, :linkedin_account, :string
    add_column :users, :github_account, :string
  end
end
