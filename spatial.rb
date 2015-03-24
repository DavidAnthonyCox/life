# Spatial calculations
# All returns are zero-indexed
# Useage: give it an index in a flat array, and an x-size for wrapping.
# Several are not used currently

module Spatial

  def wrapr(q, size, depth=0) # 11, 4 -> 0[0 1 2 3] 1[0 1 2 3] 2[0 1 2 `3] -> 3, 2
    q < size  ? [q, depth] : wrapr(q - size, size, depth + 1)
  end

  def unwrapr(x, y)
    x_pos x, x * y
  end

  def y_pos(q, size) # 10, 4 ~> 0 0 0 0 | 1 1 1 1 | 2 2 `2 2 -> 2
    (q / size.to_f).floor
  end

  def x_pos(q, size) # 9, 4 ~> 0 1 2 3 | 0 1 2 3 | `0 1 2 3 -> 0
    q - size * y_pos(q, size)
  end

  def toroidize(i, length) # 4, 4 ~> `0 1 2 3 -> 0
    i > (length - 1) ? i - length : i
  end

end