package code
{

	import flash.display.MovieClip;


	public class Bug extends Aliens
	{

		private var score:int = 50;
		private var howMany:int=10
		protected var regular:String;
		protected var datas:String;
		
		public function Bug(aDoc:Document,aName:String,aX:Number,aY:Number,aChangeInX:Number,aChangeInY:Number,aRegular:String,aData:String)
		{
			super(aDoc,aName,aX,aY,aChangeInX,aChangeInY)
			regular=aRegular;
			datas=aData;
			
		}
		private function getRegular():String
		{
			return regular
		}
		
		private function setRegular(aRegular:String):void
		{
			regular:aRegular;
		}
		private function getData():String
		{
			return datas;
		}
		private function setData(aData:String):void
		{
			datas:aData;
		}
		override public function toString():String
		{
			var info:String;
			info+=super.toString();
			info+="\nReuglar: "+ regular;
			info+="\nData: "+ datas;
			return info;
		}
	}

}