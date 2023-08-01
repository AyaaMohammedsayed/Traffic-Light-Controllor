/********************
Project: Traffic Ligth Controller.
Student: Aya Mohamed Sayed
Sec:1
B.no:9
***************
*/
//Decleration Counter and Variable i (it is needed for BCD)
int counter =0,i=0;

void main() {
//Start Project

// make portC & portB  & port D as a output  & port A as an input and digital
ADCon1=7;
Trisb =0x00;
Trisc=0b00000000;
Trisd=0;
trisa=255;



//make PortC & port B & port D is  Low and lads are low
Portc=Portb=portd=0b00000000;
//to make BCD on let bit4 on portb 1 as it is cc
portd.b4=1;

//Determine mode (Auto-Manual)


//Auto mode
if(porta.b4==0)
{
goto loop1;
}


 //manual mode
else  if(porta.b4==1)
{
goto loop2;
}



//Auto mode
loop1:
{
for(;;)
{
  //The use of Counter

for(counter=23;counter>=1;counter--)
{


//AHAD
portc=counter%10;
//Asharat
portb=counter/10;
//SOme leds to be on as the use of project
portd.b0=1;//Red1 on

portd.b7=1;//Green 2 on

portd.b6=0; //Yellow 2off

if(counter==3||counter==2||counter==1)
{
//Yellow 2 is on and Green 2off
portd.b7=0;

portd.b6=1;
}
 //Some Secound
 delay_ms(500);
}
//Red1 and green 2 and yellow 2 is off
portd.b0=0;
portd.b7=0;
portd.b6=0;
  // the use of variable i
  
for(i=15;i>=1;i--)
{
//AHAD
portc=i%10;
//Asharat
portb=i/10;
//Green 1 on
portd.b2=1;
 //Red2 on
portd.b5=1;
//yellow 1 off
portd.b1=0;
if(i==3||i==2||i==1)
{
//Yellow 1 is on and Green1 off
portd.b1=1;
portd.b2=0;

}
 //Some Secound
 delay_ms(500);
     




}
//Red2 and green 1 and yellow 1 is off
portd.b1=0;
portd.b2=0;
portd.b5=0;
}

}

 //start1
 //manual mode
loop2:
 {
 //Street-west
if(porta.b1==1)
{
 for(;;)
{

  //green 1 on
portd.b2=1;
//Red2 on
portd.b5=1;
 //Secound for led to be on
delay_ms(2000);
 //Segements doesnot play any thing
portc=0;
//for Segments to count 3 for yellow coulor
for(counter=3;counter>=1;counter--)
{

 //AHAD
portc=counter;
//yellow 1 on
portd.b1=1;
//green 1 off
portd.b2=0;
//some secound to show leds
delay_ms(500);



}

 //some secound to show leds
delay_ms(100);
 //Segements doesnot play any thing
portc=0;
//yellow 1 off
portd.b1=0;
//red1 on
portd.b0=1;
 //0.4 secound before red1 off and green 1 on
delay_ms(400);
portd.b5=0;
portd.b7=1;
//some sec to show leds
delay_ms(2000);
//led red 1 off and green 2 off
portd.b0=0;
portd.b7=0;




}
}
 // Street-South
if(porta.b1==0)
{
 for(;;)
{
 //red1 on
portd.b0=1;
//green 2 on
portd.b7=1;
 //Secound for led to be on
delay_ms(2000);
 //for Segments to count 3 for yellow coulor
for(counter=3;counter>=1;counter--)
{

  //AHAD
portc=counter;
//yellow 2 on
portd.b6=1;
//green 2 off
portd.b7=0;
//some secound to show leds
delay_ms(500);



}

  //some secound to show leds
delay_ms(100);
 //Segements doesnot play any thing
portc=0;
//yellow 2 off
portd.b6=0;
//red2 on
portd.b5=1;
 //0.4 secound before red1 off and green 1 on
delay_ms(400);
portd.b0=0;
portd.b2=1;
//some sec to show leds
delay_ms(2000);
//led red 2 off and green 1 off
portd.b5=0;
portd.b2=0;




}

 }
 
   //end1
     /*

     //start (that isnot in the project, it is addetion by my effort)
  //secound way of manual mode with buttom(counter secounds of led when is on)
loop2:
{
    //Street-west
 if(porta.b1==1)
{
 for(;;)
{
//red2 on
portd.b5=1;
 //for green1 to be on for 4 press
for( i=1;i<=4;i++)
{
//green1 on
portd.b2=1;
//sec to show led
delay_ms(100);
//for waiting press
while(porta.b2==1);


}
//sec to show led
 delay_ms(1000);
 
  //for Segments to count 3 for yellow coulor
for(counter=3;counter>=1;counter--)
{

   //AHAD
portc=counter;
//yellow 1 on
portd.b1=1;
//green 1 off
portd.b2=0;
//sec to show led
delay_ms(1000);



}
 //Segements doesnot play any thing
portc=0;
//yellow 1 off
portd.b1=0;
 //for red1 to be on for 4 press
 for( i=1;i<=4;i++)
{
 //red 1 on
portd.b0=1;

//red2 off
portd.b5=0;

//green 2 on
portd.b7=1;

//sec to show led
 delay_ms(100);
 
 //for waiting press
 while(porta.b2==1);


}

//sec to show led
delay_ms(1000);
//red1 off
portd.b0=0;
//green 2off
portd.b7=0;




}
}
  // Street-South
   if(porta.b1==0)
{
 for(;;)
{
//red1 on
portd.b0=1;

  //for green 2 to be on for 4 press
for( i=1;i<=4;i++)
{ 
//green 2 on
portd.b7=1;

//sec to show led
delay_ms(100);

 //for waiting press
while(porta.b2==1);

}
//sec to show led
 delay_ms(1000);
  
   //for Segments to count 3 for yellow coulor
for(counter=3;counter>=1;counter--)
{

     //AHAD
portc=counter;

//yellow 2 on
portd.b6=1;

//green 2 off
portd.b7=0;

//sec to show led
delay_ms(1000);



}
 //Segements doesnot play any thing
portc=0;
//yellow 2 off
portd.b6=0;

  //for red2 to be on for 4 press
 for( i=1;i<=4;i++)
{
 //red2 on
portd.b5=1;

//red1 off
portd.b0=0;

//green 1 on
portd.b2=1;

  //sec to show led
 delay_ms(100);
 
  //for waiting press
 while(porta.b2==1);


}
//sec to show led
delay_ms(1000);

//red2 off
portd.b5=0;

//green 1 off
portd.b2=0;




}
}

//end    */
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

 
 
 
 
























}

 }