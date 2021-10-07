class NewbookingsController < ApplicationController
    def index
        @newbooking = Newbooking.all
    end
    def show 
        @newbooking = Newbooking.find(params[:id])
      end
    def new
        @newbooking = Newbooking.new
    end
    def create
        @customer = Customer.find(params[:customer_id])
        @newbooking = @customer.newbookings.create(newbooking_params)
        redirect_to customer_path(@customer)
    end
    def edit
        @newbooking = Newbooking.find(params[:id])
    end
    def update
        @newbooking = Newbooking.find(params[:id])
        if @newbooking.update(newbooking_params)
            redirect_to @newbooking
        else
            render 'edit'
        end 
    end
    def destroy
        @customer = Customer.find(params[:customer_id])
        @newbooking = @customer.newbookings.find(params[:id])
        @newbooking.destroy
        redirect_to customer_path(@customer)
      end
    private
    def newbooking_params
        params.require(:newbooking).permit(:session)
    end
end
