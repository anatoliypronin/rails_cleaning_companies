class Api::V1::SessionCompaniesController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    return render json: { message: t('.Bad_params') }, status: :bad_request if params.blank? || params[:company].blank?

    sign_in_form = CompanySignInForm.new(company_attrs)
    return render json: { message: t('.PhoneNumber_is_empty') }, status: :bad_request if sign_in_form.invalid?

    if sign_in_form.sms_code.present?
      if sign_in_form.sms_code == session[:verification_code]
        company_sign_in(sign_in_form.company)
        render json: { message: t('.Auth_success') }, status: :ok
      else
        render json: { message: t('.Incorrect_sms_code') }, status: :unprocessable_entity
      end
    elsif sign_in_form.company.present?
      code = SmsService.send_sms_code(sign_in_form.phone_number)
      session[:verification_code] = code
      render json: { message: t('.Sms_sent') }, status: :ok
    else
      render json: { message: t('.Company_not_found') }, status: :not_found
    end
  end

  private

  def company_attrs
    params.require(:company).permit(:phone_number, :sms_code)
  end
end
