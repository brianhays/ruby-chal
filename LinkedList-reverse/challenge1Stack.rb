class LinkedList
attr_accessor :payload, :next_element

	def initialize(payload, next_element)
		@payload = payload
		@next_element = next_element
	end
end



class Stack
	def initialize
		@stack = nil
	end

	def empty?
		@stack == nil
	end

	def push list
		#push the item onto stack
		pusher = LinkedList.new(list.payload, @stack)
		@stack = pusher
	end

	def pop
		#pop item off stack
		unless empty?
			popper = @stack
			@stack = @stack.next_element
			popper.payload
		else
		return
		end
	end
end


ll1 = LinkedList.new(10, nil)

ll2 = LinkedList.new(5, ll1)

ll3 = LinkedList.new(2, ll2)

ll4 = LinkedList.new(1, ll3)

ll5 = LinkedList.new(0, ll4)


def output_list(list)
	return if list.nil?

	puts list.payload
	output_list list.next_element
end



def stackify_reverse(list)
	stacker = Stack.new
	while list.next_element
		stacker.push(list)
		list = list.next_element
	end
	stacker.push(list) if list.next_element == nil
	#puts stacker.inspect ### just used this during testing to make sure the stack looked right

	while stacker.empty? == false
		puts stacker.pop
	end
end

output_list(ll5)
puts "########################"
stackify_reverse(ll5)
