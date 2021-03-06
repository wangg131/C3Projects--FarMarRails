class VendorsController < ApplicationController
  def index
    @header= "Select your Vendor Name"
    # We made the names in alphabetical order and not case-sensitive
    @vendors = Vendor.order("lower(name) ASC").all
    # To direct to the Vendor route for showing one vendor
    @path = "/vendors"
  end

  def show
    @header = "Vendor Details"
    @vendor = Vendor.find(params[:id])
  end

  def new
    @header= "Add a New Vendor"
    # Allows re-use of the same form for 'new' & 'edit'
    @adj = "Add"
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(create_params[:vendor])
    @vendor.save
    redirect_to markets_url
  end

  def edit
    @header = "Edit Vendor"
    # Allows re-use of the same form for 'new' & 'edit'
    @adj = "Update"
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(create_params[:vendor])
    redirect_to markets_path
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to markets_path
  end

  private

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
