class ConsolesController < ApplicationController
  before_action :console_id, only: %i[show edit update destroy]

  def index
    @console = Console.last
    @consoles = Console.all
    @markers = @consoles.geocoded.map do |console|
      {
        lat: console.latitude,
        lng: console.longitude
      }
    end
    search
  end

  def show
  end

  def new
    @console = Console.new
  end

  def create
    @console = Console.new(console_params)
    @console.user = current_user
    @console.save
    redirect_to console_path(@console)
  end

  def edit
  end

  def update
    @console.update(console_params)
    redirect_to console_path(@console)
  end

  def destroy
    @console.destroy
    redirect_to consoles_path, status: :see_other
  end

  private

  def console_id
    @console = Console.find(params[:id])
  end

  def console_params
    params.require(:console).permit(:name, :year, :description, :address, :price_per_day)
  end

  def search
    if params[:query].present?
      @consoles = Console.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @consoles = Console.all
    end
  end
end
