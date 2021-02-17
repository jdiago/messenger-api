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

  test "should get a message" do
    get \
      messages_url,
      params: { receiver: 'alice', sender: 'bob', last_30: 't' },
      as: :json

    assert_response :success
  end

  test "should require receiver" do
    get \
      messages_url,
      as: :json

    assert_response :bad_request
  end
end
