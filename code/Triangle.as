package code
{

	import flash.display.MovieClip;


	public class Triangle extends Aliens
	{

		private var score:int = 1000;
		private var aRotation:int=0;
		private var radius:int=10
		private var howMany:Number
		private var circle:String
		
		public function Triangle(aDoc:Document,aName:String,aX:Number,aY:Number,aChangeInX:Number,aChangeInY:Number,aCircle:String)
		{
			super(aDoc,aName,aX,aY,aChangeInX,aChangeInY)
			circle=aCircle;
		}
		
		private function getCircle():String
		{
			return circle;
		}
		private function setCircle(aCircle:String):void
		{
			circle=aCircle;
		}
		override protected function moveMe()
		{
			this.x=this.x + changeInX+(radius*Math.cos(aRotation));
			this.y=this.y +(radius*Math.sin(aRotation));
			aRotation++;
		}
		private function reset()
		{
			if (aRotation>360)
			{
				aRotation=0
			}
			else
			{
				aRotation++
			}
		}
		override protected function checkWalls():void
		{
			
			if(this.x>stage.stageWidth-radius) 
			{
				
				changeInX *= -1
			}
			else
			if(this.x<0+radius)
			{
				changeInX*=-1
			}
		}
		override public function toString():String
		{
			var info:String;
			info+=super.toString();
			info+="\nCircle: "+ circle;
			return info;
		}
	}

}