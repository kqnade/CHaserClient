class Mapper

  def initialize
    @map = {}
  end

  def update (position, values)
    offsets = [[-1,-1], [0,-1], [1,-1],
                [-1,0], [0,0], [1,0],
                [-1,1], [0,1], [1,1]]

    offsets.each_with_index do |offset, i|
    pos = [position[0] + offset[0], position[1] + offset[1]]
    @map[pos] = values[i]
    end
  end

  def lookupdate(position, values, direction)
    x, y = position
    case direction
    when 2
      update(position, values)
    when 4
      update([x-2, y], values)
    when 6
      update([x+2, y], values)
    when 8
      update([x, y-2], values)
    when 5
      update([x, y+2], values)
    end
  end

  def searchupdate

end 

#* test code
map = Mapper.new
map.lookupdate([0,0], [1,2,3,4,5,6,7,8,9], 4)
p map
