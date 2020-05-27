class Api::V1::SessionCompaniesController < Api::V1::ApplicationController
  def create
    return render json: { message: 'bad params' }, status: :bad_request if params.blank? || params[:company].blank?

    sign_in_form = CompanySignInForm.new(company_attrs)
    return render json: { message: 'PhoneNumber is empty' }, status: :bad_request if sign_in_form.invalid?

    if sign_in_form.sms_code.present?
      if sign_in_form.sms_code == session[:verification_code]
        company_sign_in(sign_in_form.company)
        render json: { message: 'Auth success' }, status: :ok
      else
        render json: { message: 'Incorrect sms code' }, status: :unprocessable_entity
      end
    elsif sign_in_form.company.present?
      code = SmsService.send_sms_code(sign_in_form.phone_number)
      session[:verification_code] = code
      render json: { message: 'Sms sent' }, status: :ok
    else
      render json: { message: 'Company not found ' }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e }, status: :not_found
  end

  private

  def company_attrs
    params.require(:company).permit(:phone_number, :sms_code)
  end
end
