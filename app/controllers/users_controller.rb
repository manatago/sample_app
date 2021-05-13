class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    user.save
    params[:user][:category_ids].each do |c|
      if c !=""
        UserCategory.create(:user_id=>user.id,:category_id=>c)
      end
    end
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
