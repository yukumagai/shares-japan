class AddUserNameAndSelfIntroduceAndUserGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :screen_name, :string
    add_column :users, :self_introduce, :text
    add_column :users, :user_group, :string
  end
end
