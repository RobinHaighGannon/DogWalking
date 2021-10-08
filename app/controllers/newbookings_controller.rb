class NewbookingsController < ApplicationController
    def index
        @newbooking = Newbooking.all
    end
    def show 
        @newbooking = Newbooking.find(params[:id])
      end
    def new
        @customer = Customer.find(params[:customer_id])
        @pet = Pet.find(params[:pet_id])
        @newbooking = @pet.newbookings.build
    end
    def create
        @customer = Customer.find(params[:customer_id])
        @pet = Pet.find(params[:pet_id])
        @newbooking = @pet.newbookings.create(newbooking_params)
        redirect_to customer_pet_path(@customer, @pet)
    end
    def edit
        @newbooking = Newbooking.find(params[:id])
    end
    def update
        @pet = Pet.find(params[:pet_id])
        if @newbooking.update(newbooking_params)
            redirect_to @newbooking
        else
            render 'edit'
        end 
    end
    def destroy
        @newbooking = Newbooking.find(params[:id])
        @pet = @newbooking.pet
        @newbooking.destroy
        redirect_to customer_pet_path(@pet.customer, @pet)
      end
    private
    def newbooking_params
        params.require(:newbooking).permit(:session)
    end
end
