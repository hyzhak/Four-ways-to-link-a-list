package
{
	import tests.AddItemsTest;
	import tests.LoopItemsTest;
	import tests.RemoveItemsTest;

	import com.gskinner.performance.PerformanceTest;

	import flash.display.Sprite;
	import flash.text.TextField;


	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class PerformanceTestRunner extends Sprite
	{
		private var out : TextField;

		public function PerformanceTestRunner()
		{
			out = new TextField();
			out.width = stage.stageWidth;
			out.height = stage.stageHeight;
			addChild( out );

			PerformanceTest.getInstance().delay = 100;
			
			var log : TableLog = new TableLog();
			log.out = logTest;
			log.start( "Node collection performance tests." );
			
			primeJitCompiler();
			queueTests();
		}

		private function primeJitCompiler() : void
		{
		}

		private function queueTests() : void
		{
			PerformanceTest.queue( new AddItemsTest() );
			PerformanceTest.queue( new RemoveItemsTest() );
			PerformanceTest.queue( new LoopItemsTest() );
		}

		private function logTest( str : * ) : void
		{
			out.appendText( String( str ) + "\n" );
			out.scrollV = out.maxScrollV;
		}
	}
}
