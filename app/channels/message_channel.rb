class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'message_channel'
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    ActionCable.server.broadcast('message_channel', data)
    binding.pry
  end
end
