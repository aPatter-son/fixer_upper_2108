require './lib/room'
require './lib/house'

RSpec.describe House do
  it 'exists' do
    house = House.new("$400000", "123 sugar lane")

    expect(house).to be_a(House)
  end

  it 'has a price' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.price).to eq(400_000)
  end

  it 'has an address' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.address).to eq("123 sugar lane")
  end

  it 'starts with no rooms' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.rooms).to eq([])
  end

  it 'can add rooms' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    expect(house.rooms).to eq([])

    house.add_room(room_1)
    house.add_room(room_2)

    expect(house.rooms).to eq([room_1, room_2])
  end

  it 'can add rooms' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    expect(house.rooms).to eq([])

    house.add_room(room_1)
    house.add_room(room_2)

    expect(house.rooms).to eq([room_1, room_2])
  end

  it 'can see if house is above_market_average' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.above_market_average?).to eq(false)
  end

  it 'can see if house is above_market_average' do
    house = House.new("$600000", "123 sugar lane")

    expect(house.above_market_average?).to eq(true)
  end

  it 'can see if house is above_market_average' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
    expect(house.rooms_from_category(:basement)).to eq([room_4])
    expect(house.area).to eq(1900)
    expect(house.details).to eq({"price" => 400_000, "address "=> "123 sugar lane"})
  end

  it 'give you price per foot' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    expect(house.price_per_square_foot).to eq(210.53)
  end

  it 'sort rooms based off area' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    expect(house.rooms_sorted_by_area).to eq([room_4, room_3, room_2, room_1])
  end
end
