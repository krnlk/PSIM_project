class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new; end

  def create
    respond_to do |format|
      user_datum = UserDatum.find_by(login: params[:session][:login])
      if user_datum && user_datum.authenticate(params[:session][:password])
        format.html do
          log_in user_datum
          redirect_to user_datum
        end
        format.json do
          user_datum.password = params[:session][:password]
          user_datum.regenerate_token
          render json: { token: user_datum.token }
        end
      else
        format.html do
          render 'new'
        end
        format.json do
          render json: { message: 'Incorrect data' }
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html do
        log_out
        redirect_to root_url
      end
      format.json do
        require_token
        if current_user_datum
          current_user_datum.invalidate_token
          head :ok
        end
      end
    end
  end
end
