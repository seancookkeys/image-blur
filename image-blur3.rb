class Image
    def initialize (array)
            @image = array
    end
    
    def array
        @image
    end
    
    def output_image
        @image.each do |row|
            puts row.join
        end
    end

    def move!(distance=1)
        distance.times do
            move_coords!
        end 
    end 

private 

def move_coords!
    move_coords = []
    @image.each_with_index do |row, i|
      row.each_with_index do |x, row_i|
        move_coords << [i, row_i] if x == 1
      end
    end

    move_coords.each do |coord|
        @image[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @image[coord[0]].length - 1
        @image[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
        @image[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @image.length - 1
        @image[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
      end
    end
end 

image = Image.new([
    [0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0]
  ])
image.move!(2)
image.output_image
  