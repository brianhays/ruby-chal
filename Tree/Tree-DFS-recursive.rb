class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

end

def dfs_recursive(item, leaf=@children)
	return nil if leaf.nil?
	return leaf if item == leaf.payload

	left_side = leaf.children.empty? == false ? dfs_recursive(item, leaf.children.first) : nil
	return left_side if left_side != nil
	right_side = leaf.children.empty? == false ? dfs_recursive(item, leaf.children.last) : nil
	return right_side if right_side != nil
end



# The "Leafs" of a tree, elements that have no children
fifth_node_2    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node_2, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

puts trunk.inspect

find_it = dfs_recursive(4, trunk)

puts find_it.inspect