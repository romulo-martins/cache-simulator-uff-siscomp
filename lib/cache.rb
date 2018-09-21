class Cache
	attr_reader :size, :frames

	EMPTY_FRAME = -1

	def initialize(size = 1)
		@size = size
		@frames = [EMPTY_FRAME] * size
	end

	def to_s
		resp = "--- Cache ---\n"
		frames.each_with_index do |value, index|
			resp << "|  #{index}  |  #{value}  |\n"		
		end
		resp << "-------------\n"
		resp
	end	
end
