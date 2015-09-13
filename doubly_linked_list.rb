require_relative "node"
require 'byebug'

class DoublyLinkedList
  include Enumerable

      def initialize(val)
          # Initialize a new node at the head
          @head = Node.new(val, nil, nil)
          @tail = @head;
      end

      def add(value)
          "Adding #{value} to end"
          #since we have a tail, we just need to attach the new node to tail
          #instead of traversing to the end
          newNode = Node.new(value, nil, @tail)
          @tail.next_node = newNode
          @tail = newNode
          self
      end

      def reverse
        list = get_all_values.reverse
        new_list = DoublyLinkedList.new(list[0])
        list[1..-1].each do |val|
          new_list.add(val)
        end
        new_list.display
      end

      def get_all_values
        current = @head
        full_list = []
        while current != @tail
            full_list << current.value.to_s
            current = current.next_node
        end
        full_list << current.value.to_s
        full_list
      end

      def reverse!
        #gets the head and sets it as the tail
        return if @head.nil?
        @tmp_head = self.rtq
        @tmp_head.next_node = nil
        @tail = @tmp_head

        #repeatedly grabs the next head and attaches it to the tmporary head
        until @head.nil?
          node = self.rtq
          node.next_node = @tmp_head
          @tmp_head.prev_node = node
          @tmp_head = node
        end
        #sets the head to the temp head once the loop is done
        @head = @tmp_head
      end

      def rtq
        #returns the head and updates the head to the next node
        #which constantly removes the top of the dll
        return nil unless @head
        node = @head
        @head = @head.next_node
        return node
      end

      def delete(val)
        puts "Deleting #{val}"
        current = @head
        if current.value == val
          # If the head is the element to be deleted, the head needs to be updated
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
        full_list = get_all_values
        puts get_all_values.join("->")
      end
end


ll = DoublyLinkedList.new(5)
ll.add(7)
ll.add(10)
ll.add(15)
ll.add(18)
ll.display
ll.reverse
