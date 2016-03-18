
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class Transitions {
  SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yy");
 
  String dayDifference;
  HashMap<Integer, Integer> hmapx = new HashMap<Integer, Integer>();
  HashMap<Integer, Integer> hmapy = new HashMap<Integer, Integer>();
  HashMap<Integer, Integer> hmapd = new HashMap<Integer, Integer>();
  
 
//---------Calculating Time in terms of No of Days to next Event-----------// 
 
public String getTime(String date1,String date2){

      try {
    
        Date d1 =  formatter.parse(date1);
        Date d2 =  formatter.parse(date2);
        long difference = Math.abs(d1.getTime() - d2.getTime());
        long differenceDates = difference / (24 * 60 * 60 * 1000);
        dayDifference = Long.toString(differenceDates);
        
          } 
      catch (ParseException e) 
        {
          e.printStackTrace();
        }
      return (dayDifference);
      }

//-------------------Assign Target --------------//
    
     public void assign_target(int sourceX,int sourceY,int targetX, int targetY, int tdays)
     {  
       hmapx.put(sourceX,targetX);
       hmapy.put(sourceY,targetY);
       hmapd.put(targetX,tdays); //<>//
       
       //print( hmapx.get(sourceX) + ""); //<>//
     }
     
 //----------------- Move the Image -----------------//
    
    //<>//
    
 public void move()
  {  
   
  dx=(targetx - startx);
  dy=(targety - starty);
      
    image(celebrity,startx,starty,50,50);
    
    startx+=(dx * (step/ max_step));
    starty+=(dy * (step / max_step));

    if(Math.round(startx)==targetx)
        {
         
          if(hmapx.get(Math.round(targetx))==0)
          {
             image(celebrity,Math.round(targetx),Math.round(targety),100,100);
          }
          else
          {
           
         targetx=hmapx.get(Math.round(targetx));
         targety=hmapy.get(Math.round(targety));
         step = abs(dy) * (easying /(hmapd.get(Math.round(targetx))));   // Speed is decided on the No of Day for Concert
         print("Step "+step);
       }
  
    }
     /*    
  // Calculate the distance between my current location
  // and the target location. 

 // dx = next_xpos - x1;
 // dy = next_ypos - y1;
   dx=(targetx - startx);
   dy=(targety - starty);
  
  // Gradually move my team's image towards the target location. 
  // The speed of the animation is a function of
  // the number of days until game day.
  startx += dx * (easying / time_in_days);
  starty += dy * (easying / time_in_days); 
*/


 }
    
}