class Lfu
	attr_reader :hits, :misses

	def initialize(frames)
		@frames = frames
		@hits = 0
		@misses = 0
		@hit_count = [0] * frames.size
	end	
	
	def add(mem_ref)
		if frames.include?(mem_ref)
			@hits += 1
			value_index = frames.index(mem_ref)
			@hit_count[value_index] += 1
		else
			@misses += 1
			if frames.include?(Cache::EMPTY_FRAME)
				empty_frame_index = frames.index(Cache::EMPTY_FRAME)
				frames[empty_frame_index] = mem_ref
				@hit_count[empty_frame_index] += 1
			else
				min_hit_index = @hit_count.index(@hit_count.min)
				frames[min_hit_index] = mem_ref
				@hit_count[min_hit_index] = 1
			end	
		end
	end	

	def execute(mem_refs = [])
		mem_refs.each do |mem_ref|
			add(mem_ref)
		end	
	end

	def to_s
		'LFU'
	end	

	private 

	attr_reader :frames
end
