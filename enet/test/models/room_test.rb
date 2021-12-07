require "test_helper"

class RoomTest < ActiveSupport::TestCase

  # can create a room
  test "can't create a room if there is already a room for that module" do
    assert_raise(ActiveRecord::RecordNotUnique) { Room.create(name: "Test Room", university_module_id: university_modules(:one).id) }
  end

  test 'can create a room' do
    assert_equal 2, Room.count
    @room = Room.create(name: "Test Room", university_module_id: 3)
    assert @room.save
    assert_equal 3, Room.count
  end

  test 'can destroy a room' do
    assert_equal 2, Room.count
    @room = Room.find(1)
    @room.destroy
    assert_equal 1, Room.count
  end

end
