class PetsController < ApplicationController
  def index
    @pet = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def edit
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @pet = @customer.pets.create(pet_params)
    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @pet = @customer.pets.find(params[:id])
    @pet.destroy
    redirect_to customer_path(@customer)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed)
  end
end
