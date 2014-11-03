class LinkedList
attr_accessor :payload, :next_element

	def initialize(payload, next_element)
		@payload = payload
		@next_element = next_element
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

def reverse_mutate(list, previous=nil)
	return list if list.next_element.nil?

	top = list.next_element
	mutated = list
	list.next_element = previous
	new_next = top.next_element

	while new_next != nil
		top.next_element = mutated
		mutated = top
		top = new_next
		new_next = new_next.next_element
	end

	top.next_element = mutated
	top

end



output_list(ll4)
puts "########## viewing the actual linked list ##############"
puts ll4.inspect 
rev = reverse_mutate(ll4)
puts ""
puts "########## viewing the reversed linked list ##############"
puts rev.inspect
puts "########################"
output_list(rev)