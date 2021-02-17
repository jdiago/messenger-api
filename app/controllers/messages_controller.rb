class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

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
