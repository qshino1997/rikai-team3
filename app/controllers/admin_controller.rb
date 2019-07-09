class AdminController < ApplicationController
    before_action :check_admin

    def check_admin
        if admin_user
          flash[:danger] = "Chỉ có admin mới có thể sử dụng chức năng này"
        end 
    end  
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end  
end