class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "プロフィールを更新しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  
 private
 
 def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
 end
  
  
end