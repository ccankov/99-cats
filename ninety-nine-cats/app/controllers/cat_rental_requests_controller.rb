class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all

    render :new
  end

  def create
    @rental = CatRentalRequest.new(rental_params)

    if @rental.save
      redirect_to cat_url(@rental.cat)
    else
      redirect_to new_cat_rental_request_url
    end
  end

  def approve
    @rental = CatRentalRequest.find_by(id: params[:id])
    @rental.approve!
    redirect_to cat_url(@rental.cat)
  end

  def deny
    @rental = CatRentalRequest.find_by(id: params[:id])

    @rental.deny!
    redirect_to cat_url(@rental.cat)
  end

  private

  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date, :status)
  end
end
