#!/usr/bin/env ruby

require 'sinatra'
require 'terminal-notifier'

settings.port = 4001

module TerminalNotifierServer

  def self.notify params
    TerminalNotifier.notify params[:message],
                            params.select { |key, value| key.to_sym != :message }
  end

end

get '/notify' do
  TerminalNotifierServer::notify params
end

post '/notify' do
  TerminalNotifierServer::notify params
end
