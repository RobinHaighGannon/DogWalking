class NewbookingsController < ApplicationController
  before_action :find_customer_and_pet, only: %i[new create]
  def index
    @newbooking = Newbooking.all
  end

  def show
    @newbooking = Newbooking.find(params[:id])
  end

  def new
    @newbooking = @pet.newbookings.build
  end

  def create
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

  def find_customer_and_pet
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:pet_id])
  end
end
