class SessionsController < ApplicationController

  def logining  
    if
      user = User.where(:email => params[:session][:email]).first
      if user && user.authenticate(params[:session][:password])
        flash[:success] = 'Đăng nhập thành công'
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        render 'static_pages/home'
      else
        flash[:danger] = 'Mật khẩu không đúng'
        render 'login'
      end
    else
        flash[:danger] = 'Địa chỉ email không đúng'
        render 'login'
    end
  end

  def login
    @user = User.find(params[:id])
  end  

  def logout
    flash[:success] = 'Đăng xuất thành công'
    log_out if logged_in?
    redirect_to root_url
  end

  
end
