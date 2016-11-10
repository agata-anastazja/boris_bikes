require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  it 'expects bike to be working' do
  	bike = Bike.new
  	expect(bike.working?).to eq true
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "expects bike to be docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to include(bike)
  end

  it "expects true if there is any bike in a docked_bike array" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.any_bikes_docked?).to eq true
  end

  it 'if docked_bikes is empty, expect release_bike to raise error' do
    docked_bikes = []
    expect {subject.release_bike}.to raise_error("There are no more bikes!")
  end

  it "should return full station error if station is full and we try to dock a bike" do
    bike=Bike.new
    10.times{subject.dock(bike)}
    expect {subject.dock(bike)}.to raise_error("Docking station is full")
  end
end
