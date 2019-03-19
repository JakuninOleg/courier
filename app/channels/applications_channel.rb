class ApplicationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "applications"
  end
end
