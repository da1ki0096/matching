class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    @messages = @group.messages
    @message = Message.new
    @message.user_id = current_user.id
    @message.group_id = @group.id
  end
  def create
    @message = Message.new(user_id: current_user.id, group_id: @group.id, content: params['post']['content'])
    @message.save
    redirect_to group_messages_url, notice: 'Group was successfully created.'
  end
  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
