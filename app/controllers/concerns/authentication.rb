module Authentication
    def authenticate_request!
      token = request.headers['Authorization']&.split&.last
      return unauthorized unless token && valid_token?(token)
  
      @current_user = User.find(decoded_token['user_id'])
    rescue JWT::DecodeError, JWT::VerificationError
      unauthorized
    end
  
    private
  
    def valid_token?(token)
      decoded_token = JsonWebToken.decode(token)
      decoded_token && !expired_token?(decoded_token)
    end
  
    def expired_token?(decoded_token)
      Time.at(decoded_token['exp']) < Time.now
    end
  
    def unauthorized
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  
    def decoded_token
      JsonWebToken.decode(request.headers['Authorization'].split.last)
    end
  end
  