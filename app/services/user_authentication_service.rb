class UserAuthenticationService
  def initialize(headers)
    @headers = headers
  end

  def call
    authenticate
  end

  private

  def http_token
    @headers['Authorization'].split.last if @headers['Authorization'].present?
  end

  def authenticate
    decoded_token = JsonWebToken.decode(http_token)
    User.find_by(id: decoded_token[:user_id])
  end
end
