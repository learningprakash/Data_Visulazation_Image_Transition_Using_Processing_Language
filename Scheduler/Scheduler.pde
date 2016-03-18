PImage map,celebrity;
PImage[] venue = new PImage[7];
Table table;
int x1,y1,next_xpos,next_ypos,time_in_days=0;   //dist is measured in no of days
String next_date,curr_date;
Transitions t;


float dx;
float dy;
float easying = 0.8;
float step = 0.04f;
float max_step = 5;
float startx,starty;
float targetx,targety;


import java.util.Calendar;
import static javax.swing.JOptionPane.*;
import javax.swing.JOptionPane;
import javax.swing.JDialog;
import javax.swing.*;
import java.awt.*;
import java.awt.geom.Arc2D;

void setup(){
  frameRate(28);
  size(920,588);
  map = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/USA_Map.jpg");
  celebrity = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/celebrity.jpg");
  venue[0] = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/logo1.jpg");
  venue[1] = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/logo2.jpg");
  venue[2] = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/logo3.jpg");
  venue[3] = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/logo7.jpg");
  venue[4] = loadImage("F:/Data Visualization/Processing/Homework 4/HW4/logo5.jpg");
 
  
 table = loadTable("F:/Data Visualization/Processing/Homework 4/Schedule_Data.csv", "header");
  
   startx=table.getInt(0,"X");
   starty=table.getInt(0,"Y");
   targetx=table.getInt(1,"X");
   targety=table.getInt(1,"Y");
   t = new Transitions();
   println(table.getRowCount());
    
}

void draw()
{

  background(map);
   for (int i = 0; i<table.getRowCount(); i++)
   {
     
     // ----------Initial Setup----------//
      curr_date = table.getString(i,"Date"); 
      x1 = table.getInt(i,"X");
      y1 = table.getInt(i,"Y");
     imageMode(CENTER);
     image(venue[i],x1,y1,50,50);
     
    /* if (i==0)
     {
     imageMode(CENTER);
     image(celebrity,x1+30,y1,40,70);
     }
    */
    //--------------Calculating  Time(in Days) for Transition-----//
    
     if((i+1) < table.getRowCount())
     {
       next_date = table.getString(i+1,"Date"); 
       next_xpos = table.getInt(i+1,"X");
       next_ypos = table.getInt(i+1,"Y");
       time_in_days = parseInt(t.getTime(curr_date,next_date));
       t.assign_target(x1,y1,next_xpos,next_ypos,time_in_days);
      }
      else if((i+1) == table.getRowCount())
      {
       next_date = "lastEvent"; 
       next_xpos = 0;
       next_ypos = 0;
       curr_date = table.getString(i,"Date"); 
       x1 = table.getInt(i,"X");
       y1 = table.getInt(i,"Y");
       time_in_days=0;
       t.assign_target(x1,y1,next_xpos,next_ypos,time_in_days);
      }

t.move();


//----------------------------------//
 }
}

void mouseClicked(){
 
  for (int i = 0; i<table.getRowCount(); i++){
      String Edate = table.getString(i,"Date"); 
      String Evenue = table.getString(i,"Venue");
      String Eplace = table.getString(i,"Place");
      int EX1 = table.getInt(i,"X");
      int EY1 = table.getInt(i,"Y");
    
      
     if(mouseX>(EX1-70) && mouseX <(EX1+70)&& mouseY>(EY1-70) && mouseY <(EY1+80)){
        
          final JOptionPane pane = new JOptionPane("PROGRAM DATE:"+Edate+"\n"+"VENUE:"+Evenue+"\n"+"PLACE:"+Eplace);
          final JDialog d = pane.createDialog((JFrame)null, "Details of Concert");
          d.setLocation(mouseX+70,mouseY-100);
          d.setVisible(true);
     }
  }
    
}