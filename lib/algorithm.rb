class Algorithm
	attr_reader :misses, :hits

	def initialize(cache)
		@cache = cache
		@misses = 0
		@hits = 0
	end

	# Deve ser implementado pela classe filha
	def execute; end

	def to_s
		"Misses: #{misses} \n" \
		"Hits: #{hits} \n" \
		"Fault Rate: #{page_fault_rate}"
	end	

	protected

	attr_reader :cache

	def page_fault_rate
		(misses.to_f / (hits + misses).to_f).round(2)
	end	
end
