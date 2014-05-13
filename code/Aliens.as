package code
{
	import flash.events.Event;

	public class Aliens extends Space
	{
		
		protected var changeInX:Number;
		protected var changeInY:Number;
		protected var doc:Document
		
		public function Aliens(aDoc:Document,aName:String,aX:Number,aY:Number,aChangeInX:Number,aChangeInY:Number)
		{
			super(aName,aX,aY);
			changeInX=aChangeInX;
			changeInY=aChangeInY;
			doc=aDoc;
			
			
			addEventListener(Event.ENTER_FRAME,loop);
		
		}
		
		private function getChageInX():Number
		{
			return changeInX;
		}
		private function setChangeInX(aChangeInX:Number):void
		{
			changeInX=aChangeInX;
		}
		private function getChageInY():Number
		{
			return changeInY;
		}
		
		private function setChageInY(aChangeInY:Number):void
		{
			changeInY=aChangeInY;
		}
		public function removeListeners():void
		{
			
			removeEventListener(Event.ENTER_FRAME,loop);
			trace("i can remove")
		}
	
		private function loop(e:Event)
		{
			moveMe();
			checkWalls();
		}
		
		protected function moveMe()
		{
			this.x+= changeInX;
		}
		protected function checkWalls():void
		{
			if((x>stage.stageWidth) || (x<0))
			{
				this.y+=changeInY;
				changeInX *= -1;
			}
		}
		override public function toString():String
		{
			var info:String="\n\nAlien\n";
			info+=super.toString();
			info+="\nChangeInX: "+ changeInX;
			info+="\nChangeInY: "+ changeInY;
			return info;
		}
		

	}

}