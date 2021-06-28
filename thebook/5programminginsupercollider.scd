//5 programming in supercollider

//some objects (not data types, but objects with methods
Integer
Float
Char
String
Symbol
Point
Array
Event
Function
Meta_String

//literals
//value is represented directly in the code
"strings"
integers
floats
binary
$A - characters
classes
Literals
//scale degrees
2s
2bb

//arguments
Array.rand(*[1,2,3]);
//is the same as
Array.rand(1,2,3)


Syntax Shortcuts Help File
https://doc.sccode.org/Reference/Syntax-Shortcuts.html

//supercollider has some weird syntax
(
2 do: ({
	2.postln;
}))

OSCresponder.all

currentEnvironment;
~c = 3;

this.dump;
thisFunction.dump;
thisThread.dump

//store a container in a variable
(
var aref, cvar;
aref = Ref.new;
cvar = aref;
)





