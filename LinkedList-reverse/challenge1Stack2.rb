class LinkedList
attr_accessor :payload, :next_element

    def initialize(payload, next_element)
        @payload = payload
        @next_element = next_element
    end
end



class Stack
    attr_accessor :stack
    def initialize
        @stack = nil
    end

    def empty?
        @stack == nil
    end

    def push(payload)
        #push the item onto stack
        pusher = LinkedList.new(payload, @stack)
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


def output_list(list)
    return if list.nil?

    puts list.payload
    output_list list.next_element
end



def stackify_reverse(list)
    stacker = Stack.new
    stacker.push(list.payload)
    while list.next_element
        list = list.next_element
        stacker.push(list.payload)
    end
    
    stacker.stack
end

output_list(ll4)
puts "########################"


rev = stackify_reverse(ll4)


output_list(rev)