class UsersController < ApplicationController

before_action:forbid_user, {only: [:logout, :member]}
before_action:restrict_user, {only: [:edit, :update]}
before_action:admin_user,{only: [:new]}

  def login_form
  end


  def login
       @user = User.find_by(nickname: params[:nickname], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      flash[:notice] = "ログインできませんでした"
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def member
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
      @user = User.find_by(id: params[:id])
      @user.nickname = params[:nickname]
      @user.position = params[:position]
      @user.family = params[:family]
      @user.team = params[:team]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
      @user.save
      flash[:notice] = "更新しました"
      redirect_to("/users/#{@user.id}")
  end

  def restrict_user
       @user = User.find_by(id: params[:id])
    if @current_user.id != @user.id
      flash[:notice] = "入れませーん！"
      redirect_to("/users/member")
    end
  end

  def new
  end
  def create
      @user = User.new(name: params[:name],
        nickname: params[:nickname],
        age: params[:age],
        family: params[:family],
        team: params[:team],
        position: params[:position],
        password: params[:password],
        image_name: "ball.jpg")
      if@user.save
        flash[:notice] = "作成に成功しました"
      redirect_to("/users/member")
      else
        flash[:notice] = "必須項目を確認下さい"
        render("users/new")
      end
    end

    def admin_user
      if @current_user.id != 26
        flash[:notice] = "アクセスできません"
        redirect_to("/users/member")
      end
    end
end
