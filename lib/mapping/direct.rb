module Mapping
	class Direct
		attr_reader :hits, :misses

		def initialize(cache)
			@cache = cache
			@hits = 0
			@misses = 0
		end	

		def execute(mem_refs)
			mem_refs.each do |mem_ref|
				cache_index = (mem_ref % cache.size)
				if cache.frames[cache_index] == mem_ref
					@hits += 1
				else
					@misses += 1
					cache.frames[cache_index] = mem_ref
				end	
			end
		end

		def to_s
			"Mapeamento Direto \n" \
			"Misses: #{misses} \n" \
			"Hits: #{hits} \n" \
			"Taxa de acertos: #{hits_rate}% \n"
		end

		private 

		attr_reader :cache

		def hits_rate
			((hits.to_f / (hits + misses).to_f) * 100).round(2)
		end
	end
end	
