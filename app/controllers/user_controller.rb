class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.permit(:name, :email, :password, :image, :comment))
    
    if @user.save
      flash[:notice] = "ユーザー情報を登録しました。"
      session[:user_name] = @user.name
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render "new"
    end
  end
  
  def login_form
    @user = User.find_by(email: params[:email], password: params[:password])
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_name] = @user.name
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました。"
      redirect_to '/'
    else
      @login_failure_message = "メールアドレスまたはパスワードが間違っています。"
      @email = params[:email]
      @password = params[:password]
      render "login_form"
    end
  end
  
  def logout
    session.clear
    flash[:notice] = "ログアウトしました。"
    redirect_to '/'
  end
  
  def show
    @user = User.find_by(id: session[:user_id])
  end
  
  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(params.permit(:name, :email, :password, :image, :comment))
      flash[:notice] = "ユーザ情報を更新しました。"
      redirect_to "/"
    else
      render "show"
    end
  end
end
