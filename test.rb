require 'rubygems'
require 'bundler/setup'
# Restforce uses faye as the underlying implementation for CometD.
require 'faye'
require 'restforce'

# Initialize a client with your username/password/oauth token/etc.
Faye.logger = lambda { |m| puts m }
Restforce.log = true
client = Restforce.new :username => 'malavbhavsar@cmu.edu',
  :password       => 'password00',
  :security_token => '1Q9gGUCuMsbEvChJn7cEYZQx',
  :client_id      => '3MVG9JZ_r.QzrS7ifAY1bh_pKTQpr_0zBsWFs3401KUQfOoN7KkLSneT_DjVH6OLGlx9Lu8rJVNQlsH8EQeg_',
  :client_secret  => '7730370181055023275',
  :instance_url   => 'https://na15.salesforce.com'

# Create a PushTopic for subscribing to Account changes.
# client.create! 'PushTopic', {
#   ApiVersion: '23.0',
#   Name: 'AllAccounts',
#   Description: 'All account records',
#   NotifyForOperations: 'All',
#   NotifyForFields: 'All',
#   Query: "select Id from Account"
# }

EM.run {
  # Subscribe to the PushTopic.
  client.subscribe 'AllAccounts' do |message|
    puts message.inspect
  end
}