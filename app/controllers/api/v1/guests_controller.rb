class Api::V1::GuestsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :destroy]
  before_action :set_guest, only: [:show, :update, :destroy]

  # GET /guests
  def index
    @guests = Guest.all

    render json: @guests
  end

  # GET /guests/1
  def show
    render json: @guest
  end

  # POST /guests
  def create
    @guest = Guest.new(guest_params)
    token = SecureRandom.urlsafe_base64(nil, false)
    @guest.verification_token = token
    if @guest.save
      render json: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guests/1
  def update
    if @guest.update(guest_params)
      render json: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guests/1
  def destroy
    @guest.destroy
  end


  def destroy_by_token
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "DESTROY BY TOKEN"
    puts params
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    @guest = Guest.all.find_by(verification_token: params[:token])
    if @guest.destroy
      render json: { message: "User destroyed" }, status: :ok
    else
      render json: { message: "Error" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:email, :verification_token)


    end
end
