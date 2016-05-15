class ChangeCreateAt < ActiveRecord::Migration
  def change
  	rename_column :articles, :create_at, :created_at
  end
end
