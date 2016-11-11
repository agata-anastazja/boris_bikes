require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  it 'expects bike to be working' do
  	expect(double(:bike).working).to eq true
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "expects bike to be docked" do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.docked_bikes).to include(bike)
  end

  it 'if docked_bikes is empty, expect release_bike to raise error' do
    docked_bikes = []
    expect {subject.release_bike}.to raise_error("There are no more working bikes!")
  end

  it "should return full station error if station is full and we try to dock a bike" do

    DockingStation::DEFAULT_CAPACITY.times{subject.dock(double(:bike))}
    expect {subject.dock(double(:bike))}.to raise_error("Docking station is full")
  end

  it "expects the capacity to be default unless argument given" do
      station = DockingStation.new()
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe "Challenge 18" do
    context "when a bike is broken i can report it to the docking station" do
      it "returns false if a bike is not working" do
        double(:bike)
        station = DockingStation.new
        station.dock(double(:bike))
        expect(station.docked_bikes[0].working).to be false
      end
    end
    context "when trying to get a bike it" do
      it "doesn't realease a broken bike when you have just 1 broken bike inside the station" do
        double(:bike)
        double(:bike).report
        station = DockingStation.new
        station.dock(double(:bike))
        expect{station.release_bike}.to raise_error("There are no more working bikes!")
      end
      it "releases only working bikes when both broken and working bikes are present" do
        bike1 = double(:bike)
        bike2 = double(:bike)
        bike3 = double(:bike)
        bike4 = double(:bike)
        station = DockingStation.new
        station.dock(bike1)
        station.dock(bike2)
        station.dock(bike3)
        station.dock(bike4)
        2.times {station.release_bike}
        expect{station.release_bike}.to raise_error("There are no more working bikes!")
      end
    end
  end

end
