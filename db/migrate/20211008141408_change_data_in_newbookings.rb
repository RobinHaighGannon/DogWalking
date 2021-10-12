class ChangeDataInNewbookings < ActiveRecord::Migration[6.1]
  def change
    execute "update newbookings set pet_id=1 where pet_id=5" 
  end
end
