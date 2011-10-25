package lists
{
	import flash.utils.Dictionary;
	
	public class NoNodeList
	{
		private var _previous : Dictionary;
		private var _next : Dictionary;
		
		private var _head : *;
		private var _tail : *;
		private var _current : *;
		private var _dummy : Object;
		
		public function NoNodeList()
		{
			_previous = new Dictionary();
			_next = new Dictionary();
			_dummy = new Object();
		}
		
		public function add( data : * ) : void
		{
			if( ! _head )
			{
				_head = _tail = data;
				_previous[data] = _next[data] = null;
			}
			else
			{
				_next[_tail] = data;
				_previous[data] = _tail;
				_next[data] = null;
				_tail = data;
			}
		}
		
		public function remove( data : * ) : void
		{
			if ( _head == data)
			{
				_head = _next[_head];
			}
			if ( _tail == data)
			{
				_tail = _previous[_tail];
			}
			
			if (_previous[data])
			{
				_next[_previous[data]] = _next[data];
			}
			
			if (_next[data])
			{
				_previous[_next[data]] = _previous[data];
			}
			
			if( _current == data )
			{
				_next[_dummy] = _next[data];
				_previous[_dummy] = _previous[data];
				_current = _dummy;
			}
			delete( _next[data] );
			delete( _previous[data] );
		}
		
		public function get head() : *
		{
			_current = _head;
			return _head;
		}
		
		public function get tail() : *
		{
			_current = _tail;
			return _tail;
		}
		
		public function get next() : *
		{
			_current = _next[_current];
			return _current;
		}
		
		public function get previous() : *
		{
			_current = _previous[_current];
			return _current;
		}
	}
}
