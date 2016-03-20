class AddExpiredCol < ActiveRecord::Migration
  def change
    add_column :petitions, :expired, :string, :default => 'false'
  end
end
