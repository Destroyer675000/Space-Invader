package code
{
	import flash.display.MovieClip;

	public class Space extends MovieClip
	{
		public var names:String;
		
		public function Space(aName:String,aX:Number,aY:Number)
		{
			names=aName;
			x=aX;
			y=aY;
		}
		public function getName():String
		{
			return name;
		}
		public function setName(aName:String):void
		{
			name=aName;
		}
		override public function toString():String
		{
			var info:String="Name: "+names;
			return info;
		}

	}

}