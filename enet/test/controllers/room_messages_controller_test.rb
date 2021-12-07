require "test_helper"

class RoomMessagesControllerTest < ActionDispatch::IntegrationTest
  test "create a message" do
    post room_messages_url, params: { room_message: { message: "Hello", } }
  end
end
