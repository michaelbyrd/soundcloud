class Soundcloud
  attr_reader :client
  attr_accessor :token
  def initialize
    @client = SoundCloud.new({
      client_id:     ENV['SC_ID'],
      client_secret: ENV['SC_SECRET'],
      redirect_uri:  ENV['SC_REDIRECT']
    })
    @client.exchange_token(:code => params[:code])
    @token = client.get('/me').username
  end
end


# @client = SoundCloud.new({
#   client_id:     ENV['SC_ID'],
#   client_secret: ENV['SC_SECRET'],
#   redirect_uri:  ENV['SC_REDIRECT']
# })
# @token = @client.exchange_token(:code => params[:code])
# <%= link_to "login", @client.authorize_url %>
