# require 'method_source'
# 
# module TailCallOptimization
#   def tail_recursive(name)
#     fn = instance_method(name)
# 
#     RubyVM::InstructionSequence.compile_option = {
#       tailcall_optimization: true,
#       trace_instruction: false
#     }
# 
#     RubyVM::InstructionSequence.new(<<-EOS).eval
#       class #{to_s}
#         #{fn.source}
#       end
#     EOS
#   end
# end

require 'method_source'

module TailCallOptimization
  def tailrec(method_name)
    return if @__performing_tco
    method     = instance_method(method_name)
    file, line = method.source_location
    name, path = File.basename(file), File.path(file)
    options    = {
      tailcall_optimization: true,
      trace_instruction:     false
    }

    RubyVM::InstructionSequence.new(<<-SOURCE, name, path, line - 3, options).eval
    class #{self}
      begin
        @__performing_tco = true
        #{method.source}
      ensure
        remove_instance_variable(:@__performing_tco)
      end
    end
    SOURCE
  end
end
