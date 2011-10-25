package tests
{
	import data.PointData;
	import data.PointDataNode;
	import data.PointNode;

	import lists.DataExtendsNodeList;
	import lists.DataIsNodeList;
	import lists.NoNodeList;
	import lists.NodeContainsDataList;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class AddItemsTest extends TestSuite
	{
		private var loops : uint = 50000;
		
		private var rawData : Vector.<PointData>;
		private var rawNode : Vector.<PointNode>;
		private var rawDataNode : Vector.<PointDataNode>;
		
		private var array : Array;
		private var vector : Vector.<PointData>;
		private var dataExtendsNodeList : DataExtendsNodeList;
		private var dataIsNodeList : DataIsNodeList;
		private var nodeContainsDataList : NodeContainsDataList;
		private var noNodeList : NoNodeList;

		public function AddItemsTest()
		{
			name = "Add Items Test";
			tareTest = new MethodTest( tare );
			iterations = 1;
			tests = [ 
				new MethodTest( testArrayAdd, null, "testArrayAdd", 0, 1, "Array add" ), 
				new MethodTest( testVectorAdd, null, "testVectorAdd", 0, 1, "Vector add" ), 
				new MethodTest( testNodeContainsDataListAdd, null, "testNodeContainsDataListAdd", 0, 1, "NodeContainsDataList add" ), 
				new MethodTest( testDataExtendsNodeListAdd, null, "testDataExtendsNodeListAdd", 0, 1, "DataExtendsNodeList add" ), 
				new MethodTest( testDataIsNodeListAdd, null, "testDataIsNodeListAdd", 0, 1, "DataIsNodeList add" ), 
				new MethodTest( testNoNodeListAdd, null, "testNoNodeListAdd", 0, 1, "NoNodeList add" ), 
				];
			init();
		}
		
		private function init() : void
		{
			rawData = new Vector.<PointData>();
			rawNode = new Vector.<PointNode>();
			rawDataNode = new Vector.<PointDataNode>();
			for (var i : uint = 0; i < loops; i++)
			{
				rawData.push( new PointData() );
				rawNode.push( new PointNode() );
				rawDataNode.push( new PointDataNode() );
			}
			
			array = new Array();
			vector = new Vector.<PointData>();
			dataExtendsNodeList = new DataExtendsNodeList();
			dataIsNodeList = new DataIsNodeList();
			nodeContainsDataList =new NodeContainsDataList();
			noNodeList = new NoNodeList();
		}

		public function tare() : void
		{
			var data : PointData;
			for (var i : uint = 0; i < loops; i++)
			{
				data = rawData[i];
			}
		}

		public function testArrayAdd() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				array.push( rawData[i] );
			}
		}

		public function testVectorAdd() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				vector.push( rawData[i] );
			}
		}

		public function testDataExtendsNodeListAdd() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				dataExtendsNodeList.add( rawDataNode[i] );
			}
		}

		public function testDataIsNodeListAdd() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				dataIsNodeList.add( rawNode[i] );
			}
		}

		public function testNodeContainsDataListAdd() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				nodeContainsDataList.add( rawData[i] );
			}
		}

		public function testNoNodeListAdd() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				noNodeList.add( rawData[i] );
			}
		}
	}
}
