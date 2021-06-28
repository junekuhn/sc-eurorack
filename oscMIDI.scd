(

//OSC IN
~oscIn = {|numIn, defKey, port = 12000, path, max = 1, min = 0|
//<---OSC INPUT CONFIG SETTINGS (currently set to default Wekinator output port)
// if no max and min are provided, the message does not change.
// path should look like '/path'

	var outBus;
	outBus = Bus.control(s, numIn);

	OSCdef.new(key: defKey.asSymbol, func: { |msg, time, addr, recvPort, path |
		var outArray = Array.newClear(msg.size - 1);
		//(# of Weki outputs - 1) b/c msg[0] is msg name
		for (1, msg.size - 1, {|i| outArray[i - 1] = msg[i].linlin(min, max,0,1);} );
		//collect OSC msg vals into an array
		outBus.setn(outArray);
	}, path: path, recvPort: port);

	outBus; //return bus for receiving all msg vals from Weki OSC output
};
)

//~bus_oscIn_light = ~oscIn.value(numIn: 1, defKey: "oscDef1", port: 11000, path: '\light', min: 0, max: 50);
~bus_gloves_quat = ~oscIn.value(numIn: 1, defKey: "oscDef2", port: 8001, path: '\gloves\button', min: -1, max: 1);

{ Poll.kr( Impulse.kr(10), In.kr(~bus_gloves_quat, 4), \test) }.play
//test file writer
// ~bus_gloves = Bus.control(s, 2);
{ Out.kr(~bus_gloves, PinkNoise.kr) }.play;

(
s.waitForBoot {
	MIDIClient.init;
	~midiOut = MIDIOut(0);
	~midiOut.connect(1);
	~midiOut.latency = 0;
	~midiOut.program(1, num: 1);
}
)

MIDIClient.init
m = MIDIOut(1)
m.connect(1)
m.control(chan: 1, ctlNum: 2, val: 0)
m.latency = 0;
m.program(0,4)
(
Task({
inf.do({
	// var a, b, c;
	~bus_gloves_quat.get({
		| i |
			// m.program(0,2);
			m.control(chan: 0,ctlNum:2, val: 8.3.round(1).asInteger)
	});
	0.5.wait;
})
}).play
)

