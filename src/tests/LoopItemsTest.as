package tests
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	
	import data.PointDataImpl;
	import data.LoopTestVisitor;
	import data.PointData;
	import data.PointDataNode;
	import data.PointNode;
	
	import lists.DataExtendsNodeList;
	import lists.DataIsNodeList;
	import lists.NoNodeList;
	import lists.NodeContainsDataInterfaceList;
	import lists.NodeContainsDataList;
	import lists.nodes.ListNode;
	import lists.nodes.ListNodeWithData;

	public class LoopItemsTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var array : Array;
		private var vector : Vector.<PointData>;
		private var dataExtendsNodeList : DataExtendsNodeList;
		private var dataIsNodeList : DataIsNodeList;
		private var nodeContainsDataList : NodeContainsDataList;
		
		private var nodeVisitor : NodeContainsDataInterfaceList;
		
		private var noNodeList : NoNodeList;

		public function LoopItemsTest()
		{
			name = "Loop Items Test";
			tareTest = new MethodTest( tare );
			iterations = 1;
			tests = [ 
				new MethodTest( testArrayLoop, null, "testArrayLoop", 0, 1, "Array loop" ), 
				new MethodTest( testVectorLoop, null, "testVectorLoop", 0, 1, "Vector loop" ), 
				new MethodTest( testNodeContainsDataListLoop, null, "testNodeContainsDataListLoop", 0, 1, "NodeContainsDataList loop" ), 
				new MethodTest( testVisitor, null, "testVisitor", 0, 1, "testVisitor loop" ), 
				new MethodTest( testDataExtendsNodeListLoop, null, "testDataExtendsNodeListLoop", 0, 1, "DataExtendsNodeList loop" ), 
				new MethodTest( testDataIsNodeListLoop, null, "testDataIsNodeListLoop", 0, 1, "DataIsNodeList loop" ), 
				new MethodTest( testNoNodeListLoop, null, "testNoNodeListLoop", 0, 1, "NoNodeList loop" ), 
				];
			init();
		}
		
		private function init() : void
		{
			array = new Array();
			vector = new Vector.<PointData>();
			dataExtendsNodeList = new DataExtendsNodeList();
			dataIsNodeList = new DataIsNodeList();
			nodeContainsDataList =new NodeContainsDataList();
			nodeVisitor = new NodeContainsDataInterfaceList();
			noNodeList = new NoNodeList();
			
			for (var i : uint = 0; i < loops; i++)
			{
				var pd : PointData = new PointData();
				var pn : PointNode = new PointNode();
				var pdn : PointDataNode = new PointDataNode();
				
				var epd:PointDataImpl = new PointDataImpl();
				
				array.push( pd );
				vector.push( pd );
				dataExtendsNodeList.add( pdn );
				dataIsNodeList.add( pn );
				nodeContainsDataList.add( pd );
				nodeVisitor.add( epd );
				noNodeList.add( pd );
			}
		}

		public function tare() : void
		{
		}

		public function testArrayLoop() : void
		{
			var x : Number;
			for (var i : uint = 0; i < loops; i++)
			{
				x = array[i].x;
			}
		}

		public function testVectorLoop() : void
		{
			var x : Number;
			for (var i : uint = 0; i < loops; i++)
			{
				x = vector[i].x;
			}
		}

		public function testDataExtendsNodeListLoop() : void
		{
			var x : Number;
			var p : PointDataNode;
			for ( p = PointDataNode( dataExtendsNodeList.head ); p; p = PointDataNode( p.next ) )
			{
				x = p.x;
			}
		}

		public function testDataIsNodeListLoop() : void
		{
			var x : Number;
			var p : PointNode;
			for ( p = dataIsNodeList.head; p; p = p.next )
			{
				x = p.x;
			}
		}

		public function testNodeContainsDataListLoop() : void
		{
			var x : Number;
			var p : PointData;
			for ( var node : ListNode = nodeContainsDataList.head; node; node = node.next )
			{
				p = node.data;
				x = p.x;
			}
		}
		
		public function testVisitor():void
		{
			var visitor:LoopTestVisitor = LoopTestVisitor.getInstance();
			for ( var node : ListNodeWithData = nodeVisitor.head; node; node = node.next )
			{
				node.data.accept(visitor);
			}
		}

		public function testNoNodeListLoop() : void
		{
			var x : Number;
			var p : PointData;
			for ( p = noNodeList.head; p; p = noNodeList.next )
			{
				x = p.x;
			}
		}
	}
}
