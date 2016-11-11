class Bike
  attr_reader :working
  def initialize(working=true)
    @working = working
  end

  def report
    @working = false
  end

end



#that's a test comment
