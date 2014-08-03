Hereapp
=======

TODO:

	-Add opening application image
	
	- Enable typing a contact's name instead of just a number... no one remembers numbers these days...
	
	- Create an appealing log
	
	- Refactor


Problems faced:

	P: Takes too long to display the Messages application 
	
	S: Retrieving the location then calling reverseGeocodeLocation when the user was ready to send their location was bad design. In most cases when the user opens the app, they are in the location they would like to send, so when "applicationDidBecomeActive" is called, this is where the user's current location begins to be computed, so by the time the user is finished entering contacts and is ready to press send, the location is already available.
