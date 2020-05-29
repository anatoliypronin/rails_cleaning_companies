class Api::V1::ClientSessionsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    return render json: { message: t('.bad_params') }, status: :bad_request if params.blank? || params[:client].blank?

    sign_in_form = ClientSignInForm.new(client_attrs)
    return render json: { message: t('.empty_phone') }, status: :bad_request if sign_in_form.invalid?

    if sign_in_form.sms_code.present?
      if sign_in_form.sms_code == session[:verification_code]
        client_sign_in(sign_in_form.client)
        render json: { message: t('.auth_success') }, status: :ok
      else
        render json: { message: t('.incorrect_sms_code') }, status: :unprocessable_entity
      end
    elsif sign_in_form.client.present?
      session[:verification_code] = SmsService.send_sms_code(sign_in_form.phone_number)

      render json: { message: t('.sms_sent') }, status: :ok
    else
      render json: { message: t('.client_not_found') }, status: :not_found
    end
  end

  private

  def client_attrs
    params.require(:client).permit(:phone_number, :sms_code)
  end
end
