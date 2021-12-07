require File.dirname(__FILE__) + '/../test_helper'


class RoomMessageTest < ActiveSupport::TestCase
  fixtures :room_messages

  test 'test_room_message' do
    # Create a mew message
    message_1 = RoomMessage.new :message => room_messages(:one).message,
                                :room_id => room_messages(:one).room_id,
                                :user_id => room_messages(:one).user_id

    # Check that the title has been read correctly
    assert message_1.message == 'message1'

    # Check that the message saves
    assert message_1.save!

    # Make a copy of that message
    message_1_copy = RoomMessage.find(message_1.id)

    # Make sure that the message and its copy have the same message attribute
    # this makes sure that the message can be found by its id
    assert_equal message_1.message, message_1_copy.message

    # Make sure that we can change the message
    message_1.message = "message1_changed"

    # Make sure that we can save the message after its been changed
    assert message_1.save

    # Make sure that we can destroy the message
    assert message_1.destroy

  end

  test 'message_created_by_user_1' do
    # Create a mew message
    message_1 = RoomMessage.new :message => room_messages(:one).message,
                                :room_id => room_messages(:one).room_id,
                                :user => room_messages(:one).user
    assert message_1.save

    assert message_1.user.id == users(:one).id

  end

  test 'message has title' do
    message_1 = RoomMessage.new :message => room_messages(:one).message,
                                :room_id => room_messages(:one).room_id,
                                :user => room_messages(:one).user
    assert message_1.save
    # Check that the message body is the same as the one we created
    assert_equal "message1", message_1.message
  end
end
