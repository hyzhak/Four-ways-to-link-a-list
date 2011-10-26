package data
{
	import lists.DataExtendsNodeList;
	import lists.IData;
	import lists.IDataVisitor;
	
	public class LoopTestVisitor implements IDataVisitor
	{
		//----------------------------------
		//  params 
		//----------------------------------
		public var x:Number;
		
		private static var _instance:LoopTestVisitor;
		//----------------------------------
		//  constructor 
		//----------------------------------
		
		public function LoopTestVisitor()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Getters&setters
		//
		//--------------------------------------------------------------------------
		public static function getInstance():LoopTestVisitor
		{
			if(_instance == null)
			{
				_instance = new LoopTestVisitor;
			}
			
			return _instance;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function visit(userData:IData):void
		{
			x = PointDataImpl(userData).x;
			//x = userData.node;
		}
	}
}