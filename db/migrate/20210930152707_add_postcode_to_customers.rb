# the migration used to add a postcode column to the customers table
class AddPostcodeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :postcode, :string
  end
end
