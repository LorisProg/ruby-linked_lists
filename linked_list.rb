class LinkedList

	def initialize
		@head = Node.new()
		@tail = @head
	end

	def append(value)
		if @head.value == nil
			@head.value = value
			@tail = head
		elsif @head.next_node == nil
			@head.next_node = Node.new(value)
			@tail = @head.next_node
		else
			@tail.next_node = Node.new(value)
			@tail = @tail.next_node
		end
	end

	def prepend(value)
		@head = Node.new(value, @head)
	end

	def size
		return 0 if @head.value == nil
		currentNode = @head
		size = 1
		until currentNode.next_node == nil
			currentNode = currentNode.next_node
			size += 1
		end
		size
	end

	def head
		@head
	end

	def tail
		@tail
	end

	def at(index)
		currentNode = @head
		position = 0
		until position == index || currentNode == nil
			currentNode = currentNode.next_node
			position +=1
		end
		currentNode
	end

	def pop
		currentNode = @head
		until currentNode.next_node.next_node == nil
			currentNode = currentNode.next_node
		end
		pop = currentNode.next_node
		currentNode.next_node = nil
		@tail = currentNode
		pop
	end

	def contains?(value)
		currentNode = @head
		contains = false
		until contains || currentNode.next_node == nil
			if currentNode.value == value
				contains = true
			end
			currentNode = currentNode.next_node
		end
		contains
	end

	def find(value)
		currentNode = @head
		find = nil
		index = 1
		until find || currentNode.next_node == nil
			if currentNode.value == value
				find = index
			end
			index += 1
			currentNode = currentNode.next_node
		end
		find
	end

	def to_s
		currentNode = @head
		string = ""
		until currentNode == nil
			string = string + " -> " unless currentNode == @head
			string = string + "( #{currentNode.value} )"
			currentNode = currentNode.next_node
		end
		string + " -> nil"
	end

	def insert_at(index, value)
		self.at(index -1).next_node = Node.new(value, self.at(index))
	end

	def remove_at(index)
		self.at(index - 1).next_node = self.at(index + 1)
	end

end



class Node

	attr_accessor :value, :next_node

	def initialize(value=nil, next_node=nil)
		@value = value
		@next_node = next_node
	end

end
