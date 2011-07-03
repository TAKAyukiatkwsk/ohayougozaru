#!/usr/local/bin/ruby
$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'twitter_oauth'
require 'pit'

config = Pit.get("twitter_oauth", :require => {
  "consumer_key" => "your consumer_key",
  "consumer_secret" => "your consumer_secret",
  "token" => "your access token",
  "secret" => "your access secret"
})
#p config 
t = TwitterOAuth::Client.new({
  :consumer_key => config['consumer_key'],
  :consumer_secret => config['consumer_secret'],
  :token => config['token'],
  :secret => config['secret']
})
#p t
#p t.authorized?
#exit

if t.authorized?
  t.update 'おはようござる！' 
else
  print '認証に失敗したでござる。'
end
