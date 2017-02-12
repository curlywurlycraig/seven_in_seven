# Build a tree from a hash
class Tree
  attr_accessor :children, :node_name

  def initialize(hash)
    @node_name = hash.to_a[0][0]
    @children = []

    return if hash[@node_name].empty?

    hash[@node_name].each_pair do |k, v|
      @children.push Tree.new(k => v)
    end
  end

  def visit_all(&block)
    visit(&block)
    @children.each { |c| c.visit_all(&block) }
  end

  def visit
    yield self
  end
end

a = Tree.new(
  'grandpa' => {
    'dad' => {
      'child1' => {},
      'child2' => {},
      'child3' => {}
    }
  }
)

a.visit_all { |c| puts c.node_name }
