class Fifo
	attr_reader :hits, :misses

	def initialize(frames)
		@frames = frames
		@hits = 0
		@misses = 0
		@first_index = 0
	end	

	def add(mem_ref)
		if frames.include?(mem_ref) 
			@hits += 1
		else
			@misses += 1
			if frames.include?(Cache::EMPTY_FRAME)
				frame_index = frames.index(Cache::EMPTY_FRAME)
				frames[frame_index] = mem_ref
			else
				frames[@first_index] = mem_ref
				@first_index = (@first_index + 1) % frames.size
			end
		end
	end	

	def execute(mem_refs = [])
		mem_refs.each do |mem_ref|
			add(mem_ref)
		end
	end

	def to_s
		'FIFO'
	end	

	private 

	attr_accessor :frames
end
