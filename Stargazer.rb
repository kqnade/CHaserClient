class Clotho
  # Name idea from 'Clotho and the stargazer'.
  # This class is for mapping the field like stargaze.
  
  def initialize
    @map = {}
  end

  def update (position, values)
    offsets = [[-1,-1], [0,-1], [1,1],
                [-1,0], [0,0], [1,0],
                [-1,-1], [0,-1], [1,-1]]

    offsets.each_with_index do |offset, i|
    pos = [position[0] + offset[0], position[1] + offset[1]]
    @map[pos] = values[i]
    end
  end

  def lookupdate(position, values, direction)
    x, y = position
    case direction
    when 4
      update([x-2, y], values)
    when 6
      update([x+2, y], values)
    when 8
      update([x, y-2], values)
    when 5
      update([x, y+2], values)
    else
      p "Invalid direction"
      exit
    end
  end

  def searchupdate (position, values, direction)
    x, y = position
    offsets = []
    (1..9).each do |i|
      case direction
      when 2
        offsets << [0, i]
      when 4
        offsets << [-i, 0]
      when 6
        offsets << [i, 0]
      when 8
        offsets << [0, -i]
      end
    end

    offsets.each_with_index do |offset, i|
      pos = [position[0] + offset[0], position[1] + offset[1]]
      @map[pos] = values[i]
    end 

  end
end 