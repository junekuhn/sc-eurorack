// CALIBRATION //


//Gene Size
// all you need is from 0 to 1 and you go fully in either direction using the knob

//play the control signal once

{ Out.ar(0,Line.ar(start: 0.1, end: 0.9, dur: 2,doneAction: 2)) }

// with mouse control
(
{
        Index.ar(
            LocalBuf.newFrom([ 0,0.15,0.2,0.25, 0.3,0.4,0.5, 0.75,1 ]),
            MouseX.kr(0, 9)
        )
}.play;
)



//Morph
~value = 0.
{ Out.ar(0,Line.ar(start: 0, end: 1, dur: 60,doneAction: 2)) }.play

//Yellow Breakpoints when knob is at zero
0.075
0.02
0.31
0.42

// 1 goes all the way

//Slide - all the way down
0.0 - 0.66

//Organize
probably 0 to 1


//Edge/////////////////////////////////////
//outputs 1
//detecting that impulse
({
var trig, env, dur = 0.05;
trig = Trig.ar(SoundIn.ar(0, mul: 1, add: -0.1), dur: dur) - 0.1;
	//trig = Impulse.kr(3);

//adding an envelope to varispeed on the beginning of splice
env = Env([0,0.1, 0.0], [0.01, dur]);

Out.ar(0, EnvGen.ar(env, trig, doneAction: 0))

}.play)

if

// CV Out
// from 0 to 1

// varispeed
//from original speed max plus
// 0.075 doubles the speed
// -0.23 stops it
// -0.45 reverse speed
//at stop
// range is -0.25 to .35


~value = 0
{ Out.ar(0,K2A.ar(MouseX.kr(-0.3,0.35).poll)) }.play

// Clock
//create an env and repeat it every some milliseconds
{Impulse.ar(MouseX.kr(1,10))}.play
DC.ar(0)
{ Out.ar(0, SoundIn.ar(bus: 0, numChannels: 1).poll(trig: 100)) }.play()




/////////////////
http://composerprogrammer.com/teaching/supercollider/sctutorial/3.4%20Server-side%20Sequencing%20and%20Triggers.html

// super important that link
////////////////////////////

~level = 0.2
MouseX.kr(minval: -1,maxval: 1)

    f = { 3.yield };
    x = Routine({ f.loop });
    10.do({ x.next.postln })

    x = 5;
    y = x.repeat(6);
    y.nextN(8);

    x = Routine({ 3.do({ arg i; i.yield }) }).loop;
    x.nextN(8);

key code 0 = 'a' key

{ SinOsc.ar(800, 0, KeyState.kr(0, 0, 0.1)) }.play; //Server-side

// with mouse control
(
{
        Index.ar(
            LocalBuf.newFrom([ 0.1,0.2,0.3,0.4,0.5 ]),
            MouseX.kr(0, 5)
        )
}.play;
)

{Impulse.ar(MouseX.kr(1,10))}.play
{Dust.ar(MouseX.kr(1,100))}.play


(

{

	[

	LFNoise0.ar(100),	//step

	LFNoise1.ar(100),	//linear interpolation

	LFNoise2.ar(100)	//quadratic interpolation

	]

}.plot(0.1)

)

{ Stepper.ar(Impulse.ar(100), 0,1,10,1) }.plot(0.3,minval:0,maxval:10);

{ SinOsc.ar(Stepper.ar(Impulse.ar(10), 0,1,10,1)*100,0,0.1) }.play

/trigger whenever crossing from negative to positive

(

{var source, trigger;



source= LFNoise0.ar(100);

trigger= Trig1.ar(source, 0.001); //0.001 is duration of trigger signal output



[source, trigger]

}.plot(0.2)

)
{Trig.kr(Impulse.kr(5), dur: 0.1)}.plot(duration: 1)
(
{
    EnvGen.kr(
        Env.new(
            levels: [0, 1, 0.5, 0],
            times: [0.01, 0.01, 0.01],
            releaseNode: 2 // sustains at level 0.5 until gate is closed
        ),
        gate: Trig.kr(Impulse.kr(3), dur: 0.3)
    );
}.plot(duration: 1);
)

