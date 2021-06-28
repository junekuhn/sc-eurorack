// interesting sounds for the morphagene to sample

//some tools
{ SinOsc.ar }.plot(duration: 0.2)
FreqScope.new

// nice noise
{Resonz.ar( LPF.ar(WhiteNoise.ar(0.1),1000) , freq: MouseX.kr(300,1000), bwr: 6)}.play

// sample and hold to slide knob
{ Out.ar(1, Latch.ar( LFNoise0.ar(freq: 500), Impulse.ar(MouseX.kr(2, 20)) ) /3 ) }.play

//messing with Blip
//dc triggers recording
({ Out.ar( [0,1] , [
	Blip.ar(XLine.kr(440, 880, 0.2), numharm: 200) *0.4,
	DC.ar(MouseButton.kr(0, 1))])
}.play;)

{ DC.ar(MouseButton.kr(1,0, lag: 0.1)) }.play


//used the moog for enveloping and morph for manipulation
{ PMOsc.ar(MouseX.kr(200,1000), 400) * SinOsc.ar(MouseY.kr(200,1000)) }.play

{Mix(Saw.ar([440,443,439],0.2))}.scope //chorusing



//richer bell patch

(

var numpartials, spectrum, amplitudes, modfreqs1, modfreqs2, decaytimes;



spectrum = [0.5,1,1.19,1.56,2,2.51,2.66,3.01,4.1];



amplitudes= [0.25,1,0.8,0.5,0.9,0.4,0.3,0.6,0.1];



numpartials = spectrum.size;



modfreqs1 = Array.rand(numpartials, 1, 5.0); //vibrato rates from 1 to 5 Hz



modfreqs2 = Array.rand(numpartials, 0.1, 3.0); //tremolo rates from 0.1 to 3 Hz



decaytimes = Array.fill(numpartials,{|i|  rrand(2.5,2.5+(5*(1.0-(i/numpartials))))}); //decay from 2.5 to 7.5 seconds, lower partials longer decay



{

Mix.fill(spectrum.size, {arg i;

	var amp, freq;



	freq= (spectrum[i]+(SinOsc.kr(modfreqs1[i],0,0.005)))*500;

	amp= 0.1* Line.kr(1,0,decaytimes[i])*(SinOsc.ar(modfreqs2[i],0,0.1,0.9)* amplitudes[i]);



	Pan2.ar(SinOsc.ar(freq, 0, amp),1.0.rand2)});

}.scope



)







