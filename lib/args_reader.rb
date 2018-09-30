class ArgsReader
	def initialize(args)
		@args = args
	end

	def get_path
		return '' unless args.include?('--path')
		value_index = args.index('--path') + 1
		args[value_index]
	end

	def get_cache_size
		return 0 unless args.include?('--size')
		value_index = args.index('--size') + 1
		args[value_index].to_i
	end	

	def get_algorithm
		return '' unless args.include?('--algorithm')
		value_index = args.index('--algorithm') + 1
		args[value_index]
	end

	def get_mapping
		return '' unless args.include?('--mapping')
		value_index = args.index('--mapping') + 1
		args[value_index]
	end

	def get_set_size
		return 0 unless args.include?('--set_size')
		value_index = args.index('--set_size') + 1
		args[value_index].to_i
	end

	private

	attr_reader :args
end
