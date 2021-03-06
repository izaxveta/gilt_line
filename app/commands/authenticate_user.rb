class AuthenticateUser
  prepend SimpleCommand

  def initialize(moniker, password)
    @moniker = moniker
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

    attr_accessor :moniker, :password

    def user
      user = User.find_by(moniker: moniker)
      return user if user && user.authenticate(password)

      errors.add :user_authentication, 'invalid credentials'
      nil
    end

end

# Read more at https://www.pluralsight.com/guides/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api#2xORrIkEGyVr57UW.99