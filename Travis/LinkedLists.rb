class MrMeeseeks
  attr_accessor :next, :job
  def initialize(job = "find job")
    @job = job
  end
end

# A Mr Meeseeks Box is a queue
class MrMeeseeksBox
  attr_accessor :head

  def enqueue(job)
    mr_meeseeks = MrMeeseeks.new(job)

    if @head.nil?
      @head = mr_meeseeks
    else
      last_meeseek      = @head
      last_meeseek      = last_meeseek.next until last_meeseek.next.nil?
      last_meeseek.next = mr_meeseeks
    end
  end

  def dequeu
    mr_meeseeks = (!@head.next.nil? ? @head.next : nil)
    @head = mr_meeseeks
  end

  def display
    mr_meeseeks = @head
    until mr_meeseeks.nil?
      puts "I'm Mr Meeseks, I'll #{mr_meeseeks.job}"
      mr_meeseeks = mr_meeseeks.next
    end
  end

  alias call_mr_meeseek enqueue
  alias job_completed dequeu
end

box = MrMeeseeksBox.new

box.call_mr_meeseek("help Jerry with his golf swing")
box.call_mr_meeseek("help Beth be more confident")
box.call_mr_meeseek("help Summer be popular")
box.call_mr_meeseek("help Mr Meeseks help Jerry with his golf swing")
box.call_mr_meeseek("KILL JERRY")

box.display

box.job_completed
box.job_completed
box.job_completed

puts "jobs completed"

box.display
