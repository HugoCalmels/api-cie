class Api::V1::NewslettersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_newsletter, only: [:show, :update, :destroy]

  # GET /newsletters
  def index
    @newsletters = Newsletter.all

    render json: @newsletters
  end

  # GET /newsletters/1
  def show
    render json: @newsletter
  end

  def send_to_all_guests

    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts params[:body][:template]
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

    @list_of_guests = Guest.all
    template = params[:body][:template]

    #object = []
    #object.template = template


    @list_of_guests.each do |guest|
      #object.email = guest.email
      NewsletterMailer.newsletter(params[:body][:template], guest.email, guest.verification_token).deliver_now
    end
    render json: { message: "all newsletter emails sent"}, status: 200
  end

  # POST /newsletters
  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      render json: @newsletter
    else
      render json: @newsletter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /newsletters/1
  def update
    if @newsletter.update(newsletter_params)
      render json: @newsletter
    else
      render json: @newsletter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /newsletters/1
  def destroy
    @newsletter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def newsletter_params
      params.require(:newsletter)
    end
end
