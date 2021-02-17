require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should create a message" do
    assert_difference('Message.count') do
      post \
        messages_url,
        params: { message: { sender: 'sender', receiver: 'receiver', content: 'content' } },
        as: :json
    end
  end
end
