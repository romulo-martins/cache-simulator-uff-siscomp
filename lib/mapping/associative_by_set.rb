module Mapping
	class AssociativeBySet
		attr_reader :hits, :misses

		def initialize(cache, algoritm_name)
			@cache = cache
			@algorithms = load_algorithms(algoritm_name)
			@hits = 0
			@misses = 0
		end

		def execute(mem_refs)
			mem_refs.each do |mem_ref|
				set_index = mem_ref % cache.set.size
				# puts " Conj: #{set_index}, Valor: #{mem_ref}\n" 
				algorithms[set_index].add(mem_ref)
				# puts cache
			end
			load_result(algorithms)
		end

		def to_s
			"Mapeamento: Associativo por Conjuntos \n" \
			"Algoritmo: #{algorithms.first} \n" \
			"Misses: #{misses} \n" \
			"Hits: #{hits} \n" \
			"Taxa de acertos: #{hits_rate}% \n"
		end	

		private

		attr_reader :cache, :algorithms

		def load_result(algorithms)
			@hits = algorithms.map(&:hits).inject(0, :+) || 0
			@misses = algorithms.map(&:misses).inject(0, :+) || 0
		end	

		def load_algorithms(algoritm_name)
			algorithms = []
			cache.set.each_with_index do |frames, set_index|
				algorithms[set_index] = load_algorithm(algoritm_name, frames)
			end
			algorithms
		end

		def load_algorithm(algorithm_name, frames)
			if algorithm_name.upcase == 'FIFO'
				Fifo.new(frames)
			elsif algorithm_name.upcase == 'LRU'
				Lru.new(frames)
			elsif algorithm_name.upcase == 'LFU'
				Lfu.new(frames)
			elsif algorithm_name.upcase == 'RANDOM'
				Rand.new(frames)
			end	
		end

		def hits_rate
			return 0 if (hits + misses) == 0
			((hits.to_f / (hits + misses).to_f) * 100).round(2)
		end
	end	
end
