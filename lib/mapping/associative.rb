module Mapping
	class Associative
		attr_reader :hits, :misses

		def initialize(cache, algorithm_name)
			@cache = cache
			@algorithm_name = algorithm_name
		end	

		def execute(mem_refs)
			if algorithm_name.upcase == 'FIFO'
				algorithm = Fifo.new(cache)
			elsif algorithm_name.upcase == 'LRU'
				algorithm = Lru.new(cache)
			elsif algorithm_name.upcase == 'LFU'
				algorithm = Lfu.new(cache)
			elsif algorithm_name.upcase == 'RANDOM'
				algorithm = Rand.new(cache)
			else
				puts "Algoritmo não reconhecido!"	
			end
			if algorithm
				algorithm.execute(mem_refs)
				load_result(algorithm)
			end	
		end

		def to_s
			"Mapeamento Associativo \n" \
			"Algoritmo: #{algorithm_name} \n" \
			"Misses: #{misses} \n" \
			"Hits: #{hits} \n" \
			"Taxa de acertos: #{hits_rate}% \n"
		end

		private 

		attr_reader :cache, :algorithm_name

		def load_result(algorithm)
			@hits = algorithm.hits
			@misses = algorithm.misses
		end	

		def hits_rate
			((hits.to_f / (hits + misses).to_f) * 100).round(2)
		end
	end	
end
