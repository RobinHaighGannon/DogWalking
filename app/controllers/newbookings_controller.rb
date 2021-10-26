# frozen_string_literal: false

# contains all of the methods for the newbookings class
class NewbookingsController < ApplicationController
  before_action :find_customer_and_pet, only: %i[new create]
  def index
    @newbooking = Newbooking.all.includes(:pet)
    case params[:order]
    when 'Customer Name'
      sort_by_name
    when 'Date'
      sort_by_date
    end
    filter
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
    service_attributes
    redirect_to customer_pet_path(@customer, @pet)
  end

  def edit
    @newbooking = Newbooking.find(params[:id])
  end

  def update
    @newbooking = Newbooking.find(params[:id])
    service_attributes if @newbooking.date > Date.today
    if @newbooking.update(newbooking_params)
      redirect_to newbookings_index_path
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
    @newbooking = Newbooking.all.includes(:pet).order(:date)
  end

  def sort_by_name
    @newbooking = Newbooking.all.includes(:pet).joins(:pet).merge(Pet.joins(:customer).order('customers.name'))
  end

  private

  def newbooking_params
    params.require(:newbooking).permit(:date, :time, :paid, :complete, :service_id)
  end

  def find_customer_and_pet
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:pet_id])
  end

  def filter
    case params[:filter]
    when 'Settled'
      @newbooking = @newbooking.where(paid: true, complete: true)
    when 'Due'
      @newbooking = @newbooking.where(paid: false, complete: true)
    when 'Incomplete'
      @newbooking = @newbooking.where(complete: false)
    end
  end

  def service_attributes
    @newbooking.service_name = @newbooking.service.name
    @newbooking.price = @newbooking.service.price
    @newbooking.save
  end
end
