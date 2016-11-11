require 'bike'
describe Bike do
  context "when we initialize a new Bike instance" do
    it "should have a setter method called working" do
      expect(subject).to respond_to(:working)
    end
     it "should receive a default argument of true" do
       bike = Bike.new
       expect(bike.working).to eq true
     end
     it "should allow to receive false as argument" do
       bike = Bike.new(false)
       expect(bike.working).to eq false
     end
     it "should have a report method that changes the @working variable to false" do
       bike = Bike.new
       bike.report
       expect(bike.working).to eq false
     end

  end
end
