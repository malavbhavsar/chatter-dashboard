require 'chatter_listen'

class SessionsController < ApplicationController
  def create
    set_client
    ChatterListenEM.start(@client)
    redirect_to '/feed/feed'
  end

  protected

  def auth_hash_credentials
    request.env['omniauth.auth'][:credentials]
  end

  def set_client
    @client = Restforce.new :oauth_token => auth_hash_credentials[:token],
      :refresh_token => auth_hash_credentials[:refresh_token],
      :instance_url  => auth_hash_credentials[:instance_url],
      :client_id     => Rails.application.secrets.salesforce_key,
      :client_secret => Rails.application.secrets.salesforce_secret
  end
end