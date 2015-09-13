class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize (val, next_in_line, prev_in_line)
      @value = val
      @next_node = next_in_line
      @prev_node = prev_in_line
      puts "Initialized a Node with value:  " + value.to_s
  end
end
