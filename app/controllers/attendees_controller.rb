# frozen_string_literal: true

class AttendeesController < OpenReadController
  before_action :set_attendee, only: %i[show update destroy]

  # GET /attendees
  def index
    @attendees = Attendee.all

    render json: @attendees
  end

  # GET /attendees/1
  def show
    render json: @attendee
  end

  # POST /attendees
  def create
    @attendee = current_user.attendees.build(attendee_params)

    if @attendee.save
      render json: @attendee, status: :created, location: @attendee
    else
      render json: @attendee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendees/1
  def update
    if @attendee.update(attendee_params)
      render json: @attendee
    else
      render json: @attendee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendees/1
  def destroy
    @attendee.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendee
    # @attendee = Attendee.find(params[:id])
    @attendee = current_user.attendees.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def attendee_params
    params.require(:attendee).permit(:user_id, :event_id, :paid)
  end
  private :set_attendee, :attendee_params
end
