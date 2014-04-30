module ChatterListenEM

  def self.start(client)
    pushtopics = client.query('select Name from PushTopic').map(&:Name)
    unless pushtopics.include?('AllProxyFeedItem')
      client.create! 'PushTopic', {
        ApiVersion: '30.0',
        Name: 'AllProxyFeedItem',
        Description: 'All ProxyFeedItem',
        NotifyForOperations: 'All',
        NotifyForFields: 'All',
        Query: "SELECT Id, Body__c, CommentCount__c, LikeCount__c, Type__c, User__c from ProxyFeedItem__c"
      }
    end
    Thread.abort_on_exception = true
    Thread.new {
      EM.run do
        client.subscribe 'AllProxyFeedItem' do |message|
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