package lists
{
	import lists.nodes.ListNodeWithData;
	
	public interface IData
	{
		function get node():ListNodeWithData;
		function set node(value:ListNodeWithData):void;
		
		function accept(v:IDataVisitor):void;		
	}
}