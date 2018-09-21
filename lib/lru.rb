class Lru
	attr_reader :misses, :hits

	def initialize(cache)
		@cache = cache
		@misses = 0
		@hits = 0
	end

	def execute(mem_refs = [])
		count = [0] * cache.size
		mem_refs.each do |value|
			if cache.frames.include?(value) 
				@hits += 1
				value_index = cache.frames.index(value)
				count[value_index] = 0
			else
				@misses += 1
				if cache.frames.include?(Cache::EMPTY_FRAME)
					empty_frame_index = cache.frames.index(Cache::EMPTY_FRAME)
					cache.frames[empty_frame_index] = value
				else
					count_index = count.index(count.max)
					cache.frames[count_index] = value
					count[count_index] = 0
				end
			end
			count.map! { |c| c += 1 }
		end
	end

	private 

	attr_reader :cache
end
