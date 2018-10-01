class Rand 
	attr_reader :hits, :misses

	def initialize(frames)
		@frames = frames
		@hits = 0
		@misses = 0
	end	

	def add(mem_ref)
			if frames.include?(mem_ref)
				@hits += 1
			else
				@misses += 1
				if frames.include?(Cache::EMPTY_FRAME)
					empty_frame_index = frames.index(Cache::EMPTY_FRAME)
					frames[empty_frame_index] = mem_ref
				else
					random_index = rand(0..frames.size) % frames.size
					frames[random_index] = mem_ref
				end	
			end	
	end	

	def execute(mem_refs = [])
		mem_refs.each do |mem_ref|
			add(mem_ref)
		end
	end

	def to_s
		'RANDOM'
	end

	private

	attr_reader :frames
end
