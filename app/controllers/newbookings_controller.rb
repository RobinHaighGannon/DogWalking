# frozen_string_literal: false

# contains all of the methods for the newbookings class
class NewbookingsController < ApplicationController
  before_action :find_customer_and_pet, only: %i[new create]
  def index
    @newbooking = Newbooking.all.includes(:pet, :service)
    if params[:order] && params[:order] == 'Customer Name'
      sort_by_name
    elsif params[:order] && params[:order] == 'Date'
      sort_by_date
    end
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
    @newbooking = @newbooking.sort_by(&:date)
  end

  def sort_by_name
    @newbooking = @newbooking.sort_by { |obj| obj.pet.customer.name }
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
