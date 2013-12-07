class Edge
	attr_reader :u, :v, :weight
	
	def initialize(u, v, weight = 1)
		@u = u
		@v = v
		@weight = weight
	end
end

class Graph

	edgelist = [] { [] }

	def add(e)
		edgelist[e.u] << e
		edgelist[e.v] << e
	end

	def delete(e)
		edgelist[e.u].delete(e)
		edgelist[e.v].delete(e)
	end

	def BFS
		par = Array.new(edgelist.size, -1)
		bfi = Array.new(edgelist.size)
		dist = Array.new(edgelist.size)
		
		q = [edgelist[0]]

		until q.empty? do
			q[0].each do |edge|
				if par[edge.u] == -1 then 
					q.push edgelist[edge.u]
					par[edge.u] = edge.v
				q.push edgelist[edge.v] if par[edge.v] == -1
			end
			q.shift
		end

	end
end

def BFS
	node = 
end

def DFS

end

def prim

end

def kruskal

end

def boruvka

end
