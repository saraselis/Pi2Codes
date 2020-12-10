/********************************************************
 * PID Basic Example
 * Reading analog input 0 to control analog PWM output 3
 ********************************************************/

#include <PID_v1.h>

#define PIN_INPUT 0
#define PIN_OUTPUT 5

//Define Variables we'll be connecting to
double Setpoint, Input, Output;

//Specify the links and initial tuning parameters
double Kp=19, Ki=25, Kd=4; //
PID myPID(&Input, &Output, &Setpoint, Kp, Ki, Kd, DIRECT);

void setup()
{
  Input = analogRead(PIN_INPUT); //primeira leitura para poder calcular o erro
  Setpoint = 1; //definir o parametro de inicio

  //turn the PID on e designa como automatico
  myPID.SetMode(AUTOMATIC);
}

void loop()
{
  Input = (12/1023.0)*analogRead(PIN_INPUT); //le o sensor e escalona. 12v/1023(resoluçao do arduino)
  myPID.Compute(); //processa o PID
  analogWrite(PIN_OUTPUT, Output); //envia a saída do PID para o PWM
}
