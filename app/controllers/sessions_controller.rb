class SessionsController < ApplicationController

  def logining  
    if
      user = User.where(:email => params[:session][:email]).first
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to user
        if current_user.admin? 
        flash[:success] = 'Đăng nhập admin'
        else current_user?(user)
        flash[:success] = 'Đăng nhập người dùng'
        end
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
  end  

  def logout
    flash[:success] = 'Đăng xuất thành công'
    log_out if logged_in?
    redirect_to root_url
  end

  
end
