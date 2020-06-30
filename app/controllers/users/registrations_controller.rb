# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  def new
    @user = User.new
    @user.build_profile
  end  

  def create
    @user = User.new(sign_up_params)
    @user.build_profile(sign_up_params[:profile_attributes])
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    session[:profile_attributes] = sign_up_params[:profile_attributes]
    @sending_destination = @user.build_sending_destination
    render :new_sending_destination
  end

  def create_sending_destination
    @user = User.new(session["devise.regist_data"]["user"])
    @profile = @user.build_profile(session[:profile_attributes])
    @sending_destination = SendingDestination.new(sending_destination_params)
    unless @sending_destination.valid?
      flash.now[:alert] = @sending_destination.errors.full_messages
      render :new_sending_destination and return
    end
    @user.build_sending_destination(@sending_destination.attributes)
    @user.save
    @profile.save
    session["devise.regist_data"]["user"].clear
    session[:profile_attributes].clear
    sign_in(:user, @user)

    redirect_to root_path
  end

  protected

  def sending_destination_params
    params.require(:sending_destination).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :post_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end

end
