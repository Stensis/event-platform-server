class ApplicationController < ActionController::Base
    # current_user method retrieves the JWT token from the request headers. It decodes the token using the secret key and verifies the signature. If the token is valid, it extracts the user_id from the token's payload and finds the corresponding user in the database.
    def current_user
        return @current_user if @current_user
    
        token = request.headers['Authorization']&.split&.last
        return unless token
    
        decoded_token = JWT.decode(token, '7939b08d52588c0f9dd2371bf3bfe12aee5ab9d0f64339c06ae7575da056ba9cf3b19206d86473e15c09c453ae91b45c66a60412a85b0320342334697c391fed', true, algorithm: 'HS256')
        user_id = decoded_token.first['user_id']
        @current_user = User.find_by(id: user_id)
      rescue JWT::DecodeError, JWT::ExpiredSignature
        nil
      end
    
      def authenticate_user!
        unless current_user
          render json: { error: 'Not logged in' }, status: :unauthorized
        end
      end
end
