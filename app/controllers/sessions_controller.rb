class SessionsController < ApplicationController

  def logining  
    if
      user = User.where(:email => params[:session][:email]).first
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if current_user.admin? 
        flash[:success] = 'Đăng nhập admin'
        redirect_to user
      else current_user?(user)
        flash[:success] = 'Đăng nhập người dùng'
        render 'static_pages/home'
        end
      else
        flash[:danger] = 'Mật khẩu không đúng'
        render 'login'
      end
    else
        flash.now[:danger] = 'Địa chỉ email không đúng'
        render 'login'
    end
  end
  def login
  end  

  def logout
    flash[:danger] = 'Đã đăng xuất'
    log_out if logged_in?
    redirect_to root_url
  end

  
end
