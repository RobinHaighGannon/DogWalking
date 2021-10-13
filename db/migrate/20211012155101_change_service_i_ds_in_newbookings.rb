class ChangeServiceIDsInNewbookings < ActiveRecord::Migration[6.1]
  def change
    execute "update newbookings set service_id=2" 
  end
end
