class RoomsController < ApplicationController

  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  # def index
  #    @rooms = current_user.rooms
  # end

  def new
    @room = @room.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
      render :new
    end
  end

  def show
  end

  def update
    new_params = room_params
    if @room.update(new_params)
      flash[:notice] = "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
    end
    redirect_back(fallback_location: request.referer)
  end

  private

    def set_room
      @room = Room.find_by(params[:room.id])
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
    end
end