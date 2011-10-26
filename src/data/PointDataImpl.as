package data
{
	import lists.IData;
	import lists.nodes.ListNode;
	import lists.IDataVisitor;
	import lists.nodes.ListNodeWithData;
	
	public class PointDataImpl implements IData
	{
		//----------------------------------
		//  params 
		//----------------------------------
		private var _node:ListNodeWithData;
		
		public var x : Number = 1;
		public var y : Number = 1;
		
		//----------------------------------
		//  constructor 
		//----------------------------------
		
		public function PointDataImpl()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Public Getters&setters
		//
		//--------------------------------------------------------------------------
		
		public function get node():ListNodeWithData
		{
			return _node;
		}
		
		public function set node(value:ListNodeWithData):void
		{
			_node = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function accept(v:IDataVisitor):void
		{
			v.visit(this);
		}
	}
}