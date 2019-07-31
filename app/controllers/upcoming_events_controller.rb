class UpcomingEventsController < ApplicationController
  before_action :set_upcoming_event, only: [:show, :edit, :update, :destroy]

  # GET /upcoming_events
  # GET /upcoming_events.json
  def index
    @upcoming_events = UpcomingEvent.all
  end

  # GET /upcoming_events/1
  # GET /upcoming_events/1.json
  def show
  end

  # GET /upcoming_events/new
  def new
    @upcoming_event = UpcomingEvent.new
  end

  # GET /upcoming_events/1/edit
  def edit
  end

  # POST /upcoming_events
  # POST /upcoming_events.json
  def create
    @upcoming_event = UpcomingEvent.new(upcoming_event_params)

    respond_to do |format|
      if @upcoming_event.save
        format.html { redirect_to @upcoming_event, notice: 'Upcoming event was successfully created.' }
        format.json { render :show, status: :created, location: @upcoming_event }
      else
        format.html { render :new }
        format.json { render json: @upcoming_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upcoming_events/1
  # PATCH/PUT /upcoming_events/1.json
  def update
    respond_to do |format|
      if @upcoming_event.update(upcoming_event_params)
        format.html { redirect_to @upcoming_event, notice: 'Upcoming event was successfully updated.' }
        format.json { render :show, status: :ok, location: @upcoming_event }
      else
        format.html { render :edit }
        format.json { render json: @upcoming_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upcoming_events/1
  # DELETE /upcoming_events/1.json
  def destroy
    @upcoming_event.destroy
    respond_to do |format|
      format.html { redirect_to upcoming_events_url, notice: 'Upcoming event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upcoming_event
      @upcoming_event = UpcomingEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upcoming_event_params
      params.require(:upcoming_event).permit(:title, :content, :date, :image)
    end
end
