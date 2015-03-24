# Cell
# Cells only know *how many* neighbors they have. 
# Cells don't know their location. 
# Those poor helpless cells.

require_relative 'imports'

class Cell
  include Living
  attr_accessor :neighbors
  attr_reader :alive

  def cycle!
    @alive ? (self.smite unless @neighbors.between?(2,3)) 
           : (self.inspire if @neighbors == 3)
    # @alive = @alive ? @neighbors.between?(2,3) : @neighbors == 3
  end

end