#!/usr/bin/ruby

# Vou refatorar, calma!
def fifo(cache, mem_refs)
	misses = 0
	hits = 0
	first_index = 0
	mem_refs.each do |value|
		if cache.include?(value) 
			hits += 1
		else
			misses += 1
			if cache.include?(-1)
				cache[cache.index(-1)] = value
			else
				cache[first_index] = value
				first_index = (first_index + 1) % cache.size
			end
		end
		print_cache(cache, misses, hits)	
	end	
end	

def lru(cache, mem_refs)
	# TODO: 
end	

def lfu(cahce, mem_refs)
	# TODO: 
end

def random(cache, mem_refs)
	# TODO: 
end	

def print_cache(cache, misses, hits)
	puts("--- Cache ---")
	cache.each_with_index do |value, index|
		puts "|  #{index}  |  #{value}  |"		
	end
	puts('-------------')
	print("Misses: #{misses}, Hits: #{hits}")
	puts
end	

mem_refs = File.readlines('tests/example2.txt').map(&:to_i)
cache = [-1] * 4
fifo(cache, mem_refs)
