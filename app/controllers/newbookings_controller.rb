# frozen_string_literal: false

# contains all of the methods for the newbookings class
class NewbookingsController < ApplicationController
  before_action :find_customer_and_pet, only: %i[new create]
  def index
    @newbooking = Newbooking.all.includes(:pet, :service)
    case params[:order]
    when 'Customer Name'
      sort_by_name
    when 'Date'
      sort_by_date
    end
    @newbooking = @newbooking.paginate(page: params[:page], per_page: 20)
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
    redirect_to newbookings_index_path
  end

  def sort_by_date
    @newbooking = Newbooking.all.includes(:pet, :service).order(:date)
  end

  def sort_by_name
    @newbooking = Newbooking.all.includes(:pet,
                                          :service).joins(:pet).merge(Pet.joins(:customer).order('customers.name'))
  end

  private

  def newbooking_params
    params.require(:newbooking).permit(:date, :time, :service_id)
  end

  def find_customer_and_pet
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:pet_id])
  end
end
