# Experiment

require_relative 'spatial'

class Experiment
  include Spatial
  attr_accessor :sample
  attr_accessor :symbol_view
  attr_accessor :neighbor_map
  attr_accessor :wrap_size
  attr_reader :sample_size

  def initialize(x_size=50, y_size=50, fail_rate=70)
    @wrap_size = x_size
    @sample = []
    @neighbor_map = [1, x_size, x_size + 1, x_size - 1, -1, -x_size - 1, -x_size, -x_size + 1]
    the_cells = []
    @sample_size = x_size * y_size
    @sample_size.times do |i|
      new_cell = Cell.new
      new_cell.populate(fail_rate)
      the_cells.push new_cell
    end
    @sample.push *the_cells
  end

  def neighbors_for(i)
    neighbors = 0
    @neighbor_map.each { |offset|
      neighbor_index = toroidize( offset + i, @sample_size )
      neighbors += 1 if @sample[ neighbor_index ].alive
    }
    neighbors
  end

  def invert
    @sample.each(&:toggle)
  end

  def invert!
    @sample.each(&:toggle!)
  end

  # part of recursive version
  # def frame_buffer(frame=[], pixel=0, count=@wrap_size)
  #   count == 0 ? frame : frame_buffer( frame + [@sample[pixel].symbol], pixel+1, count-1 )
  # end

  def render_frame#(frame=[], pixel=0, count=@sample_size, buffer=@wrap_size*2)
    @symbol_view = []
    sample.each { |cell| symbol_view << cell.symbol }
    OutputConsole.render @symbol_view, wrap_size
    # recursive version... ahh curses! ahh curses!
    # count == 0 ? (OutputConsole.render frame, wrap_size) 
    #            : render_frame( frame_buffer(frame, pixel, buffer), pixel+buffer, count-buffer )
  end

  def run! # todo: something less irritating than 2x iteration?
    @sample.each { |cell|
      cell.neighbors = neighbors_for(@sample.index(cell))
    }
    @sample.each { |cell|
      cell.cycle!
    }
  end

end