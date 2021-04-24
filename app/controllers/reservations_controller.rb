class ReservationsController < ApplicationController
  def index
    @user = session[:user_id]
    @reservations = Reservation.where(user_id: @user)
  end
  
  def new
    
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :number_of_people, :total_fee, :user_id, :room_id, :fee))
    @reservation_errors = []
    if session[:user_id] == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to "/rooms/#{@reservation.room_id}"
    else
      if @reservation.start_date.nil?
        @reservation_errors << "開始日を入力してください。"
      end
      if @reservation.end_date.nil?
        @reservation_errors << "終了日を入力してください。"
      end
      if @reservation.number_of_people.nil?
        @reservation_errors << "人数を入力してください。"
      elsif @reservation.number_of_people <= 0
        @reservation_errors << "人数の入力に誤りがあります。"
      end
      
      if @reservation_errors != []
        flash[:notice] = @reservation_errors
        redirect_to "/rooms/#{@reservation.room_id}"
      else
        @days = (@reservation.end_date.to_i - @reservation.start_date.to_i)/(24*3600)
        @total_fee = @days*@reservation.fee*@reservation.number_of_people
        @user = session[:user_id]
      end
    end
    
  end
  
  def create
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :number_of_people, :total_fee, :user_id, :room_id, :fee))
    if @reservation.save
      flash[:notice] = "予約しました。"
      redirect_to "/"
    else
      render "new"
    end
  end
  
end
