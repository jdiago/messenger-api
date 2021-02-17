class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:receiver].blank?
      render json: { receiver: "can't be blank" }, status: :bad_request
      return
    end

    @messages = Message.where(receiver: params[:receiver]).
      order(created_at: :desc)

    @messages = @messages.where(sender: params[:sender]) if params[:sender]

    @messages = if params[:last_30] == 't'
      @messages.where('created_at > ?', 30.days.ago)
    else
      @messages.limit(100)
    end
  end

  def create
    @message = Message.new message_params

    respond_to do |format|
      if @message.save
        format.json { render :show, status: :created, location: @message }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def message_params
      params.require(:message).permit(:sender, :receiver, :content)
    end
end
