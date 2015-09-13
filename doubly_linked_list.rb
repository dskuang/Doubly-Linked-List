require_relative "node"
require 'byebug'

class DoublyLinkedList
      def initialize(val)
          # Initialize a new node at the head
          @head = Node.new(val, nil, nil)
          @tail = @head;
      end

      def add(value)
          #since we have a tail, we just need to attach new node to tail
          #instead of traversing to the end
          newNode = Node.new(value, nil, @tail)
          @tail.next_node = newNode
          @tail = newNode
          self
      end

      def reverse!
        return if @head.nil?
        @tmp_head = self.rtq
        @tmp_head.next_node = nil
        @tail = @tmp_head

        until @head.nil?
          node = self.rtq
          node.next_node = @tmp_head
          @tmp_head.prev_node = node
          @tmp_head = node
        end
        @head = @tmp_head
      end

      def rtq
        return nil if @head.nil?
        node = @head
        @head = @head.next_node
        return node
      end

      def delete(val)
          puts "Deleting #{val}"
          current = @head
          if current.value == val
            # If the head is the element to be delete, the head needs to be updated
            @head = @head.next_node
            @head.prev_node = nil
          elsif
            #checks if the tail needs to be deleted
            val == @tail.value
            tail_prev = @tail.prev_node
            tail_prev.next_node = nil
            @tail = tail_prev

          else
            #iterates to the node before the node to be deleted
            while current && current.next_node && ((current.next_node).value != val)
                current = current.next_node
            end
            #sets node to (next next node) and sets (next next node's) prev to current
            if current && current.next_node
                connecting_node = (current.next_node).next_node
                current.next_node = connecting_node
                connecting_node.prev_node = current
            end
          end
      end

      def display
          # Traverse through the list until you hit the tail
          current = @head
          full_list = []
          while current != @tail
              full_list << current.value.to_s
              current = current.next_node
          end
          #pushes in the tail and then joins with arrow to print
          full_list << current.value.to_s
          puts full_list.join("->")
      end
end


ll = DoublyLinkedList.new(5)
ll.add(7)
ll.add(10)
ll.add(15)
ll.add(18)
ll.display
ll.reverse!
ll.display
