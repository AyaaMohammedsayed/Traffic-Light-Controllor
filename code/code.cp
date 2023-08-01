#line 1 "C:/Users/Aya Mohamed/Documents/training2/communication-embedded system/project_traffic ligthcontroller/code/code.c"
#line 9 "C:/Users/Aya Mohamed/Documents/training2/communication-embedded system/project_traffic ligthcontroller/code/code.c"
int counter =0,i=0;

void main() {



ADCon1=7;
Trisb =0x00;
Trisc=0b00000000;
Trisd=0;
trisa=255;




Portc=Portb=portd=0b00000000;

portd.b4=1;





if(porta.b4==0)
{
goto loop1;
}



else if(porta.b4==1)
{
goto loop2;
}




loop1:
{
for(;;)
{


for(counter=23;counter>=1;counter--)
{



portc=counter%10;

portb=counter/10;

portd.b0=1;

portd.b7=1;

portd.b6=0;

if(counter==3||counter==2||counter==1)
{

portd.b7=0;

portd.b6=1;
}

 delay_ms(500);
}

portd.b0=0;
portd.b7=0;
portd.b6=0;


for(i=15;i>=1;i--)
{

portc=i%10;

portb=i/10;

portd.b2=1;

portd.b5=1;

portd.b1=0;
if(i==3||i==2||i==1)
{

portd.b1=1;
portd.b2=0;

}

 delay_ms(500);





}

portd.b1=0;
portd.b2=0;
portd.b5=0;
}

}



loop2:
 {

if(porta.b1==1)
{
 for(;;)
{


portd.b2=1;

portd.b5=1;

delay_ms(2000);

portc=0;

for(counter=3;counter>=1;counter--)
{


portc=counter;

portd.b1=1;

portd.b2=0;

delay_ms(500);



}


delay_ms(100);

portc=0;

portd.b1=0;

portd.b0=1;

delay_ms(400);
portd.b5=0;
portd.b7=1;

delay_ms(2000);

portd.b0=0;
portd.b7=0;




}
}

if(porta.b1==0)
{
 for(;;)
{

portd.b0=1;

portd.b7=1;

delay_ms(2000);

for(counter=3;counter>=1;counter--)
{


portc=counter;

portd.b6=1;

portd.b7=0;

delay_ms(500);



}


delay_ms(100);

portc=0;

portd.b6=0;

portd.b5=1;

delay_ms(400);
portd.b0=0;
portd.b2=1;

delay_ms(2000);

portd.b5=0;
portd.b2=0;




}

 }
#line 445 "C:/Users/Aya Mohamed/Documents/training2/communication-embedded system/project_traffic ligthcontroller/code/code.c"
}

 }
