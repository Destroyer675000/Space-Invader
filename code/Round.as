package code
{

	import flash.display.MovieClip;


	public class Round extends Aliens
	{
		private var score:int = 10;
		private var bullet:Boolean;
		private var defend:Boolean;
		private var howMany:Number;
		public function Round(aDoc:Document,aName:String,aX:Number,aY:Number,aChangeInX:Number,aChangeInY:Number,aBullet:Boolean, aDefend:Boolean)
		{
			super(aDoc,aName,aX,aY,aChangeInX,aChangeInY);
			bullet=aBullet;
			defend=aDefend;
		}
		private function getDefend():Boolean
		{
			return defend;
		}
		private function setDefend(aDefend:Boolean)
		{
			defend=aDefend;
		}
		private function getBullet():Boolean
		{
			return"i have bullets?"+bullet;
		}
		
		private function setBullet(aBullet:Boolean) 
		{
			bullet=aBullet;
		}
		override protected function moveMe()
		{
			this.y +=  changeInY;
		}
		override protected function checkWalls():void
		{
			if (this.y > stage.stageHeight || this.y < 0)
			{
				this.x +=  changeInX;
				changeInY *=  -1;
			}
		}
		override public function toString():String
		{
			var info:String;
			info+=super.toString();
			info+="\nBullet: "+ bullet ;
			info+="\ndDefend: "+ defend;
			return info;
		}
		

	}

}