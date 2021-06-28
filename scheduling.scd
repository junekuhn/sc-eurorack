//do something in 2 seconds
SystemClock.sched(delta: 2, item:  {"event".postln} );

//if the last thing returns a number it's rescheduled (repeated in seconds)
SystemClock.sched(delta: 0, item: {"repeat".postln; 1} );

//tempo clock is in terms of beats
TempoClock.sched(delta: 0, item: {"beat".postln; 3} );

//Routine is like a function, can be evaluated at any time
r = Routine({Array.fill(4, {|x| x*2})});
r.next;

//Routines can be inputs to SystemClock
(
SystemClock.sched(0, Routine({
	"event".postln;
	1.yield;
	"next".postln;
	0.5.yield;
	"again".postln
});)
)

//wait = yield, and next = value

//fork is a shortcut for creating a routine and playing it on the clock
({
	"event".postln;
	1.yield;
	"2".postln;
}.fork;)

//a task is like a routine, but is meant to be played only with a Clock.
(
t = Task({
	loop({
		3.do({
			"one".postln;
			0.5.yield;
			"two".postln;
			0.5.yield;
			"three".postln;
			0.5.yield;
		});
		"end of do".postln;
	});
}, clock: SystemClock);
)
t.play;
t.stop;
t.reset;

//The score objects is an ordered list of times and OSC commands
//it takes the form of nested arrays
//also handy for nrt synthesis
x = [
	[0.0, [\default]],
	[1.0, [\default]],
	[2.0, [\default, etc]],
	[3.0, [\default, etc]],
];
z = Score(x);


HID.findAvailable











