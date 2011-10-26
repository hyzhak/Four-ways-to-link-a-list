package lists.nodes
{
	import lists.IData;
		
	public class ListNodeWithData
	{
		public var previous : ListNodeWithData;
		public var next : ListNodeWithData;
		public var data : IData;
	}
}