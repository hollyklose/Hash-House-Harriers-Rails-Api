This Rails API serves as a backend database to host users who are runners in the Boston Hash House Harriers. Each user can create an account and log in to see past and upcoming running events. They can RSVP for an event (as long as the date is not already passed), or un-RSVP if their plans change.

Admin users called "hash cash" can update whether or not a user has paid for a given event (and how much). They are able to do this regardless of whether an event has already passed.

The database is comprised of three tables: User, Event and a join table of Attendee.

Technololgies used include: Ruby, Rails

Development process: I started with a single, unattached resource, Event, and made sure I could CRUD. Then I added a one to many connection between User and Events, and made sure I could CRUD. I used an OpenRead controller so that users could only edit/delete their own events, but can see all events. Finally, I added the Attendee join table to allow many users at one event and many events attended by one user.

I made sure to add the dependent:destroy to events to be sure attendees are deleted when the relevant event is.

I also added a default ordering for events to have them displayed based on the "date" column, not the date created.

Unsolved problems: I wish to create admin privileges on the backend so that certain users can edit everyone's data. I also want to add some validations on the backend to require certain paramaters, but not others.

ERD: https://i.imgur.com/e5llgZK.jpg

The Github repository for the client side of this application is located at: https://github.com/hollyklose/Hash-House-Harriers-client

Deployed API: https://sleepy-atoll-90720.herokuapp.com/
Deployed Client side: https://hollyklose.github.io/Hash-House-Harriers-client/
