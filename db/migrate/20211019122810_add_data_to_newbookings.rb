class AddDataToNewbookings < ActiveRecord::Migration[6.1]
  def change
    newbooking = Newbooking.all
    today = Date.today
    begin
      newbooking.each do |booking|
        # if the booking is in the past we will assume it has been completed and paid
        booking.complete = booking.date < today
        booking.paid = booking.date < today
        puts booking.paid
        booking.save
      end
    rescue StandardError => e
      puts today
      raise e
    end
  end
end
