# Application
# Conway's game of life (plus my irrelevant noodling)

require_relative 'imports'
require_relative 'cell'
require_relative 'experiment'

class App

  def self.run_experiment(frequency=0.04)
    e = Experiment.new
    while true
      e.render_frame
      e.run!
      sleep frequency
    end
  end

  def self.flash # a screen test of sorts
    e = Experiment.new
    25.times {
      e.render_frame
      e.invert!
      sleep 0.25
    }
  end

end

App.run_experiment
