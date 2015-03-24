# OutputConsole 

class OutputConsole

  def self.render(frame, x_size)
    # mutation version
    while frame.length > 0
      puts frame[0..x_size-1].join
      frame = frame[x_size..frame.length-1]
    end
    
    # recursive version
    # puts frame[0..x_size-1].join
    # render( frame[x_size..-1], x_size ) if frame.length > x_size
  end

end