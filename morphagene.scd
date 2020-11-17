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


//Edge
//outputs 1

// CV Out
// from 0 to 1

// Clock
{ Out.ar(0, SoundIn.ar(bus: 0, numChannels: 1).poll(trig: 100)) }.play()




/////////////////


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