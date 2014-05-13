package code
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	public class Document extends MovieClip
	{
		private var aliens:Array=new Array();
		private var count:Number = 10;
		private var howManyBullets:Number = 100;
		private var bullet:Bullet;
		private var bulletArray:Array;
		private var currentBullet:int = 0;
		private var speed:Number=20;

		public function Document()
		{

			var bug:Bug;
			var triangle:Triangle;
			var round:Round;
			for (var count:int = 0; count < 10; count++)
			{
				bug = new Bug(this,"Bug",10 * count + 50,10 + 40 * (count % 5),10,15,"regluar","not special");
				bug.height = 20;//changing the height to make the alien smaller
				bug.width = 20;// changing the width to make the alien thinner
				//making the alien "monster"
				addChild(bug);
				//adding alien to the alien array
				aliens.push(bug);
			}
			


			for (var coun:int = 0; coun < 6; coun++)
			{
				triangle=new Triangle(this,"Triangle",20 * coun + 40,15 + 50 * (coun % 3),7,25,"I can spin circles");
				addChild(triangle);
				triangle.height = 20;
				triangle.width = 20;
				aliens.push(triangle);
			}
			for (var cout:int = 0; cout < 20; cout++)
			{
				round=new Round(this,"Round",25 * cout + 40,15 + 50 * (cout % 3),5,5,true,true);
				addChild(round);
				round.height = 20;
				round.width = 20;
				aliens.push(round);
			}
			
			trace("I have " + aliens.length + " aliens.");

			bullet=new Bullet();
			bulletArray=new Array();
			createBullet(howManyBullets);
			addChildAt(bullet,getChildIndex(gun));

			makeEventListener();
		}
		

		private function createBullet(howMany:Number):void
		{
			var temp:Bullet;

			for (var count:int = 0; count < howMany; count++)
			{
				temp = new Bullet  ;
				temp.x = -500;
				addChildAt(temp,getChildIndex(gun));
				bulletArray.push(temp);
			}
			trace("we made " + bulletArray.length + " bullets.");
		}
		private function makeEventListener():void
		{
			addEventListener(Event.ENTER_FRAME,moveGun);
			addEventListener(Event.ENTER_FRAME,testForHit);
			stage.addEventListener(MouseEvent.CLICK,fire);
		}
		protected function testForHit(e:Event)
		{
			for (var i:int = bulletArray.length-1; i>-1; i--)
			{
				for (var count:int = aliens.length-1; count >-1 ; count--)
				{
					if (aliens[count].hitTestObject(bulletArray[i]) == true)
					{
						trace("we hit aliens number " + count);
						removeChild(aliens[count]);
						aliens[count].removeListeners();
						aliens.splice(count,1);
						removeChild(bulletArray[i]);
						bulletArray.splice(i,1);
						trace(aliens[count]);
						if(aliens[count].names=="Round")
						   {
							   changeScore(50);
						   }
						 else if(aliens[count].names=="Triangle")
							{
								changeScore(1000);
							}
						else if(aliens[count].names=="Bug")
						{
							changeScore(10);
						}
						
					}
					if (aliens[count].hitTestObject(gun) == true)
					{
						trace("we hit launcher");
						changeScore(-1);
						trace(aliens.length);
					}

				}
			}
		}

		private function changeScore(scoreChange:int):void
		{
			var scoreAsNumber:int;
			var scoreAsText:String;
			scoreAsNumber = int(score.text);
			scoreAsNumber +=  scoreChange;
			scoreAsText = String(scoreAsNumber);
			score.text = scoreAsText;
		}
		public function fire(e:MouseEvent)
		{
			bulletArray[currentBullet].x = gun.x;
			bulletArray[currentBullet].y = gun.y;
			currentBullet++;
			if (currentBullet >= bulletArray.length)
			{
				currentBullet = 0;
			}
		}
		public function moveGun(e:Event)
		{
			gun.x = mouseX;
			if (gun.x < 33)
			{
				gun.rotation = 90;
				gun.y = mouseY;
				gun.x = 33;
				gun.y;
			}
			else
			{
				gun.rotation = 0;
				gun.y = 369.5;
			}


		}
	}

}