pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
bullets={}

function _init()
 //sets initial position to center
 //of the screen
 //offset by 6 on x for sprite size
 x=64-6
 y=128-16
 
 music(0,0,0)
 
 //vars used for shooting
 shooting=false
 shot=false
 timer=0
 
 //players bullet type, 1-3
 --[[
 	1=normal shot
 	2=speed shot
 	3=double shot
 ]]
 btype=3
end

function _update()
 //checks for input and screen border
	//offset of 1 for sprite size
	if btn(⬅️) and x > 0+1 then
		x -= 3
	end
	
	//checks for input and screen border
	//offset of 16 for sprite size
	if btn(➡️) and x < 128-16 then
		x += 3
	end
	
	//controls how fast and often
	//a player can shoot
	if timer == 0 then
		if btn(5) then
			if shot==false then
				shot=true
				shooting=true
			else
				shooting=false
				//delay on shooting
				timer=3
			end
		else
		 shot=false
		 shooting=false
		end
	else
		timer-=1
	end
	
	//updates all bullets in list
	for b in all(bullets) do
  b:update()
 end
end

function _draw()
 cls()
 
 //checks to see if player has
 //shot
 if (shooting) then
  //passes the players bullet
  //type
  shoot(btype)
 end
 
 //draws all bullets in list
 for b in all(bullets) do
  b:draw()
 end
 
 spr(3,x,y,2,2)
end

//paramter b is the kind of bullet
//being fired 1-3
function shoot(b)
 //creates bullets and sets
 //update and draw function for
 //each bullet added
	add(bullets,{
	 //bullet position
  x=x+4,
  y=y,
  
  //draws bullets
  draw=function(self)
  	//checks for default bullet
			if (b==1) then
				spr(33,self.x,self.y,1,1)
				
			//checks for speed shot
			elseif (b==2) then
				spr(34,self.x,self.y,1,1)
				
			//checks for double shot
			elseif (b==3) then
				spr(35,self.x+7,self.y,1,1)
				spr(35,self.x-6,self.y,1,1)
			end
  end,
  
  //updates bullets
  update=function(self)
 		//checks for default bullet
			if (b==1) then
				self.y-=3
				if self.y<-8
	   then
	    del(bullets,self)
	   end
	   
			//checks for speed shot
			elseif (b==2) then
				self.y-=6
				if self.y<-8
	   then
	    del(bullets,self)
	   end
				
			//checks for double shot
			elseif (b==3) then
				self.y-=4
				if self.y<-8
	   then
	    del(bullets,self)
	   end
			end
  end
 })
end

__gfx__
00000000000000000000000000000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000000008800000000000006cc60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000077000000000000051150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000080777708000000000051150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700008070777707080000000556655000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007077777777070008006556655600800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000777777777777000c006550055600c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777777777777005506556655605500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777777777777065606556655606560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777777777770065666555555666560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000077777777000005565550055565500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000c0cccc0c000065666050050666560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000060056080080650060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000055000000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000088000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c7c0000600060000772000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0703070006c7c600600aa0600072e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003b300070ccc07000a9900000ee2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03b7b300006c60000099800000e22000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003b3000007c700000a8900000220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07030700000c000000f8800000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700000089000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700000008000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000008800000000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077770000000000070770700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000707707000000000077aa7700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0660077aa77006600070007aa7000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6760007aa7000766077777c88c777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
077777c88c77777077666cccccc66677000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777cccccc777007600cccccccc0067000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007cccccccc70007000cccccccc0007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000cccccccc0000000ccc7667ccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ccc6666ccc0000000667777660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00006667766600000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777777000000000097777900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000977779000000000990000990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00009900009900000000900000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077770000000000000000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777777000000000000000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007667777700000000000000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007767777777000000000fff7777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00076677777770000000ffffff770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007767777777770000fffffffff70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007667777777770000ffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777777777000fffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777777777000fffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777777777000ffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777777677000ffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077777777670000fffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000777777766700000ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000777776670000000ffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0110071d1375006750097500f750147501b7501d7501e7501e7501e7501e75000400231501b150221501e15021150201501f15020150004001a5501b750004000140000400024000340002400024000140000400
010f0000035500555007550075500a5500a5500c5500c5500c5500f5500f5500f5500f5500f5501155011550135501355013550165501655016550185501b5501b5501b550185501655013550135501155011550
010f00000555005550055500555005550055500555005550055500555005550055500555005550055500555007550075500755007550075500755007550055500555005550055500555007550075500755007550
000f0000111101311016110181121b112181101811218112161101b1111d1101d1101b1101d112221102211222110221101f1101f11122110221101f1121f1101f1101f1121f1121f1101d1101d1111d1111d110
001000001b0101d0101f010240102701027012220121f0121d0101d0101f011220102701029012290122b0122b0102b011290102701224011220102201122011270102b0122b0122e0102b0122b0122b0122b012
000f0000187111871018712167121171011710117111171013710117101171216710137101d71016711187101b710167121b7101b7101b712187101f71018711227001b710277122771027710247102271200010
__music__
00 01024343
01 05020444
00 03020504
02 41020405

