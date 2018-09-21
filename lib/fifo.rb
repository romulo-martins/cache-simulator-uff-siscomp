class Fifo
	attr_reader :misses, :hits

	def initialize(cache)
		@cache = cache
		@misses = 0
		@hits = 0
	end

	def execute(mem_refs = [])
		first_index = 0
		mem_refs.each do |value|
			if cache.frames.include?(value) 
				@hits += 1
			else
				@misses += 1
				if cache.frames.include?(Cache::EMPTY_FRAME)
					frame_index = cache.frames.index(Cache::EMPTY_FRAME)
					cache.frames[frame_index] = value
				else
					cache.frames[first_index] = value
					first_index = (first_index + 1) % cache.size
				end
			end
		end	
	end

	private 

	attr_accessor :cache
end
