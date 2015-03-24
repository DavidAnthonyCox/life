module Living
  ALIVE = :██
  DEAD = :░░
  # SICK? RESTING? THINKING_EVIL_THOUGHTS? What other state-symbols might there be?! ZOMG!

  def populate(fail_rate)
    @alive = rand >= (fail_rate / 100.0)
  end

  def inspire
    @alive = true
    # placeholder: rays of light animation (hard to do in terminal... hmmm...)
  end

  def smite
    @alive = false
    # todo: annoying sound effect? Demonic laughter?
  end

  def toggle
    @alive ? false : true
  end

  def toggle!
    @alive = @alive ? false : true
  end

  def symbol
    @alive ? ALIVE : DEAD
  end

end