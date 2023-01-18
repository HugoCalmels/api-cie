class Api::V1::ContactDemandsController < ApplicationController

  before_action :set_contact_demand, only: [:show, :update, :destroy]

  # GET /contact_demands
  def index
    @contact_demands = ContactDemand.all

    render json: @contact_demands
  end

  # GET /contact_demands/1
  def show
    render json: @contact_demand
  end

  # POST /contact_demands
  def create
    @contact_demand = ContactDemand.new(contact_demand_params)

    puts "££££££££££££££££££££££££££££££££££££££££££££££"
    puts "££££££££££££££££££££££££££££££££££££££££££££££"
    puts "££££££££££££££££££££££££££££££££££££££££££££££"
    puts "££££££££££££££££££££££££££££££££££££££££££££££"

    puts "££££££££££££££££££££££££££££££££££££££££££££££"
    puts "££££££££££££££££££££££££££££££££££££££££££££££"
    puts "££££££££££££££££££££££££££££££££££££££££££££££"
    puts "££££££££££££££££££££££££££££££££££££££££££££££"


    if @contact_demand.save
      ContactMailer.contact(ContactDemand.last).deliver_now
      render json: @contact_demand
    else
      render json: @contact_demand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_demands/1
  def update
    if @contact_demand.update(contact_demand_params)
      render json: @contact_demand
    else
      render json: @contact_demand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_demands/1
  def destroy
    @contact_demand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_demand
      @contact_demand = ContactDemand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_demand_params
      params.require(:contact_demand).permit(:name, :subject, :email)
    end
end
