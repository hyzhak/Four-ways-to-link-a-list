package lists.nodes
{
	import lists.IData;
	
	/**
	 * 
	 * @project	Experiment Richardlord Four-ways-to-link-a-list
	 * 
	 * @data	Oct 26, 2011 / 10:37:28 AM
	 * 
	 * @author	Eugene Krevents aka Hyzhak 
	 * 
	 */
	
	public class ListNodeWithData
	{
		public var previous : ListNodeWithData;
		public var next : ListNodeWithData;
		public var data : IData;
	}
}