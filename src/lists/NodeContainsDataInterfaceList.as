package lists
{
	import lists.nodes.ListNodeWithData;
	
	public class NodeContainsDataInterfaceList
	{
		
		//----------------------------------
		//  params 
		//----------------------------------
		public var head : ListNodeWithData;
		public var tail : ListNodeWithData;
		
		//----------------------------------
		//  constructor 
		//----------------------------------
		
		public function NodeContainsDataInterfaceList()
		{
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		public function add( userData : IData ) : ListNodeWithData
		{
			var node : ListNodeWithData = new ListNodeWithData();
			node.data = userData;
			
			if( ! head )
			{
				head = tail = node;
			}
			else
			{
				tail.next = node;
				node.previous = tail;
				tail = node;
			}
			return node;
		}
		
		public function remove( userData : IData ) : void
		{
			var node : ListNodeWithData = userData.node;
			
			if( !node )
			{
				return;
			}

			if ( head == node)
			{
				head = head.next;
			}
			
			if ( tail == node)
			{
				tail = tail.previous;
			}
			
			if (node.previous)
			{
				node.previous.next = node.next;
			}
			
			if (node.next)
			{
				node.next.previous = node.previous;
			}
		}
	}
}