module ChatterListenEM

  def self.start(client)
    pushtopics = client.query('select Name from PushTopic').map(&:Name)
    unless pushtopics.include?('AllAccounts')
      client.create! 'PushTopic', {
        ApiVersion: '23.0',
        Name: 'AllAccounts',
        Description: 'All Accounts records',
        NotifyForOperations: 'All',
        NotifyForFields: 'All',
        Query: "SELECT Id FROM Account"
      }
    end
    Faye.logger = lambda { |m| puts m }
    Restforce.log = true
    Thread.abort_on_exception = true
    Thread.new {
      Thread.current[:name]  = "AllAccounts"
      EM.run do
        client.subscribe 'AllAccounts' do |message|
          print "===================================="
          print "Recieved message"
          ap message
          PrivatePub.publish_to "/messages/new", :chat_message => message
        end
      end
    }
    die_gracefully_on_signal
  end

  def self.die_gracefully_on_signal
    Signal.trap("INT") { EM.stop }
    Signal.trap("TERM") { EM.stop }
  end
end