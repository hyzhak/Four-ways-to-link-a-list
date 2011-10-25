package lists
{
	import lists.nodes.ListNodeBase;
	public class DataExtendsNodeList
	{
		public var head : ListNodeBase;
		public var tail : ListNodeBase;
		
		public function add( node : ListNodeBase ) : void
		{
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
		}
		
		public function remove( node : ListNodeBase ) : void
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
