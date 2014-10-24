class Image

    def initialize(image)
        @img = image
    end


    def output_image
        puts "### new image ###"
        @img.each do |x|
            x.each do |y|
                print y
            end
            puts
        end
    end
   

    def blurred(amount=0)

        while amount > 0
            
            cloned = []
            cloned = Marshal.load( Marshal.dump( @img ) ) ## Deep copy using Marshal
      
            cloned.each_with_index do |rowval, rowindex|
            	rowval.each_with_index do |colval, colindex|
                	if cloned[rowindex][colindex] == 1
                        @img[(rowindex - 1)][colindex] = 1 if rowindex != 0
                        @img[(rowindex + 1)][colindex] = 1 if rowindex != @img.length - 1
                        @img[rowindex][(colindex - 1)] = 1 if colindex != 0
                        @img[rowindex][(colindex + 1)] = 1 if colindex != @img[0].length - 1                   
                    end
                end
            end
                
            amount = amount - 1
        end

            puts "######## Blurring image #######"
            self.output_image      
    end

end

image = Image.new([
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,1,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0]
])

image.output_image

image.blurred(4)

