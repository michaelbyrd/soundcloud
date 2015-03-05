class WelcomeController < ApplicationController
  def index
    @client = SoundCloud.new(client_id: ENV['SC_ID'])
    @tracks = @client.get('/tracks', :limit => 10, :order => 'hotness')

  end

end
