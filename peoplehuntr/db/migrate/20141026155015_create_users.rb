class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.boolean :registered_user
      t.string :bio
      t.string :skill_string
      t.string :need_string
      t.string :linkedin_token
      t.string :github_token
      t.string :linkedin_username
      t.string :github_username
      t.string :linkedin_data_api
      t.string :github_data_api
      t.string :photo

      t.timestamps
    end
  end
end
