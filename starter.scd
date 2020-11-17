(
// Get the default server's options
o = Server.default.options;

// Set them to a new number
o.numOutputBusChannels = 8; // The next time it boots, this will take effect
o.numInputBusChannels = 4;
// specify a device

o.device ="ES-8";     // use a specific soundcard

// finally, boot the server
Server.default.boot;
)

// if shit don't work
Server.default.reboot;

//test each output
{ Out.ar(0,PinkNoise.ar(0.4, 0));}.play

//stop is ctrl+.
