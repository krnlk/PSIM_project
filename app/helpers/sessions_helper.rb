module SessionsHelper
    def log_in(user_datum)
        session[:user_datum_id] = user_datum.id
    end
        
    def current_user_datum
        @current_user_datum ||= UserDatum.find_by(id: session[:user_datum_id])
    end

    def logged_in?
        !current_user_datum.nil?
    end

    def log_out
        session.delete(:user_datum_id)
        @current_user_datum = nil
    end

    def require_token
        respond_to do |format|
            format.json {
                authenticate_token || render_unauthorized("Access denied")
            }
            format.html { }
        end
    end

    def render_unauthorized(message)
        errors = { errors: [ { detail: message } ] }
        render json: errors, status: :unauthorized
    end

    def authenticate_token
        authenticate_with_http_token do |token, options|
        @current_user_datum ||= UserDatum.find_by(token: token)
    end
  end
end
