class Lfu < Algorithm
	def execute(mem_refs = [])
		hit_count = [0] * cache.size
		mem_refs.each do |value|
			if cache.frames.include?(value)
				@hits += 1
				value_index = cache.frames.index(value)
				hit_count[value_index] += 1
			else
				@misses += 1
				if cache.frames.include?(Cache::EMPTY_FRAME)
					empty_frame_index = cache.frames.index(Cache::EMPTY_FRAME)
					cache.frames[empty_frame_index] = value
					hit_count[empty_frame_index] += 1
				else
					min_hit_index = hit_count.index(hit_count.min)
					cache.frames[min_hit_index] = value
					hit_count[min_hit_index] = 1
				end	
			end
		end	
	end
end
