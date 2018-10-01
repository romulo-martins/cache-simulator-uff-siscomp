module Mapping
	class Associative
		attr_reader :hits, :misses

		def initialize(cache, algorithm_name)
			@cache = cache
			@algorithm = load_algorithm(algorithm_name)
		end	

		def execute(mem_refs)
			if algorithm
				algorithm.execute(mem_refs)
				load_result(algorithm)
			else 
				puts "Algoritmo não reconhecido!"	
			end	
		end

		def to_s
			"Mapeamento: Associativo \n" \
			"Algoritmo: #{algorithm} \n" \
			"Misses: #{misses} \n" \
			"Hits: #{hits} \n" \
			"Taxa de acertos: #{hits_rate}% \n"
		end

		private 

		attr_reader :cache, :algorithm

		def load_algorithm(algorithm_name)
			if algorithm_name.upcase == 'FIFO'
				Fifo.new(cache.frames)
			elsif algorithm_name.upcase == 'LRU'
				Lru.new(cache.frames)
			elsif algorithm_name.upcase == 'LFU'
				Lfu.new(cache.frames)
			elsif algorithm_name.upcase == 'RANDOM'
				Rand.new(cache.frames)
			end	
		end

		def load_result(algorithm)
			@hits = algorithm.hits
			@misses = algorithm.misses
		end	

		def hits_rate
			return 0 if (hits + misses) == 0
			((hits.to_f / (hits + misses).to_f) * 100).round(2)
		end
	end	
end
