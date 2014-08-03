Hereapp
=======

TODO:

	-Add opening application image
	
	- Enable typing a contact's name instead of just a number... no one remembers numbers these days...
	
	- Create an appealing log
	
	- Refactor


Problems faced:

	P: Took to long to bring up messenger because retrieving the user's current location occured when the user pressed "I'm here".
	
	S: Retrieving the location then calling reverseGeocodeLocation when the user was ready to send their location was bad design. In most cases when the user opens the app, they are in the location they would like to send, so when "applicationDidBecomeActive" is called, this is where the user's current location begins to be computed, so by the time the user is finished entering contacts and is ready to press send, the location is already available.
