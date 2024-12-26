class MembersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit_description edit_personal_details update_description update_personal_details]
  before_action :set_user,
                only: %i[show edit_description edit_personal_details update_description update_personal_details]

  def show; end

  def edit_description; end

  def edit_personal_details; end

  def update_description
    return unless current_user.update(about: params[:user][:about])

    respond_to do |format|
      if current_user.update(about: params[:user][:about])
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            'member-description',
            partial: 'members/member_description',
            locals: { user: current_user }
          )
        end
      end
    end
  end

  def update_personal_details
    respond_to do |format|
      if current_user.update(user_personal_info_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            'member-personal-details',
            partial: 'members/member_personal_details',
            locals: { user: current_user }
          )
        end
      end
    end
  end

  private

  def user_personal_info_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :country, :pincode, :profile_title)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
