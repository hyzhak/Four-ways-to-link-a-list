package lists
{
	import lists.nodes.ListNode;

	import flash.utils.Dictionary;
	
	public class NodeContainsDataList
	{
		public var head : ListNode;
		public var tail : ListNode;
		private var nodes : Dictionary = new Dictionary( true );
		
		public function add( data : * ) : ListNode
		{
			var node : ListNode = new ListNode();
			node.data = data;
			nodes[ data ] = node;
			
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
		
		public function remove( data : * ) : void
		{
			var node : ListNode = nodes[ data ];
			if( !node )
			{
				return;
			}
			delete( nodes[ data ] );
			if( node )
			{
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
}
