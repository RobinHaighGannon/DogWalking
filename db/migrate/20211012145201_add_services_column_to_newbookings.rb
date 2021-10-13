class AddServicesColumnToNewbookings < ActiveRecord::Migration[6.1]
  def change
    add_column :newbookings, :service_id, :integer
    execute 'update newbookings set service_id=1'
    add_foreign_key :newbookings, :services
  end
end
