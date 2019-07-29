class ProjectChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'project_channel'
  end
end