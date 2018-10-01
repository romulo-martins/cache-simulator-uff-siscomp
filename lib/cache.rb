class Cache
	attr_reader :size, :frames

	EMPTY_FRAME = -1

	def initialize(size)
		@size = size
		@frames = load_frames
	end

	def to_s
		resp = "-------- Cache --------\n"
		resp << " Pos Cache | Mem. Ref. \n"
		resp << "-----------------------\n"
		frames.each_with_index do |frame, frame_index|
			resp << "|" + (" " * (10 - frame_index.to_s.size)) + "#{frame_index}|"
			resp << (" " * (10 - frame.to_s.size)) + "#{frame}|\n"
		end
		resp << "-----------------------\n"
		resp
	end	

	private 

	def load_frames
		[EMPTY_FRAME] * size
	end	
end
