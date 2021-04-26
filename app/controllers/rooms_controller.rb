class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    if params[:search_area] == "" #エリア検索で入力なしの場合、全件表示
      return
    elsif params[:search_area]
      @rooms = Room.where(address: params[:search_area])
    end
    if params[:search_keyword] #キーワード検索はLIKEを用いてるため、未入力に対しては全県を返す。
      @rooms = Room.where("name LIKE?", "%#{params[:search_keyword]}%").or(Room.where("address LIKE?", "%#{params[:search_keyword]}%"))
    end
  end
  
  def new
    @room = Room.new
    @user = session[:user_id]
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :fee, :address, :image, :user_id))
    @user = session[:user_id]
    
    if @room.save
      flash[:notice] = "ルーム情報を登録しました。"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
