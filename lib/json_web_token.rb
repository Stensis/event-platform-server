require 'jwt'

class JsonWebToken
  SECRET_KEY = '7939b08d52588c0f9dd2371bf3bfe12aee5ab9d0f64339c06ae7575da056ba9cf3b19206d86473e15c09c453ae91b45c66a60412a85b0320342334697c391fed'

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY).first
  rescue JWT::DecodeError
    nil
  end
end

  