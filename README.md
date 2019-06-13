This Rails API serves as a backend database to host users who are runners in the Boston Hash House Harriers. Each user can create an account and log in to see past and upcoming running events. They can RSVP for an event (as long as the date is not already passed), or un-RSVP if their plans change.

Admin users called "hash cash" can update whether or not a user has paid for a given event (and how much). They are able to do this regardless of whether an event has already passed.

The database is comprised of three tables: User, Event and a join table of Attendee.

Technololgies used include: Ruby, Rails

Development process: I started with a single, unattached resource, Event, and made sure I could CRUD. Then I added a one to many connection between User and Events, and made sure I could CRUD. I used an OpenRead controller so that users could only edit/delete their own events, but can see all events. Finally, I added the Attendee join table to allow many users at one event and many events attended by one user.

I made sure to add the dependent:destroy to events to be sure attendees are deleted when the relevant event is.

I also added a default ordering for events to have them displayed based on the "date" column, not the date created.

As I'm finally now finishing the first version of this project, I have run into and solved three new problems!

First, I hadn't realized I needed to add "current_user" into the controller to make sure people could only destroy and update their own resources. I was thinking I only needed current_user as a criteria to display (ie. show or index) only the users' resources, which I didn't wish to do. When I went to add the current_user, and similarly the set_event method, in my events controller, I used current_user.events which was incorrect and my edit and delete abilities broke. Because events and users are joined by the attendees table and both can have many of each other, I created a separate relationship called "event_creator" which is the user who actually created a specific event.

While I recognize the name is terrible and needs to be changed, I followed the lesson example of "primary_care_doctor" and called the inverse resource, "event_creator_receiver" (like "primary_care_doctor_receiver," the patient). While it sounds confusing, my set_event method needed to be current_user.event_creator_receivers as that is the name of the events as they belong to specific users. Once I made this change and fixed my delete and edit methods, I went on to add current_user to my attendee controller as well and fix bugs as they came up.

After that, I spent a long time figuring out how to check to see if the current logged in user had the hash_cash admin privileges to update anyone's attendee "paid" status. I finally figured out to check for if current_user[:hash_cash]. I didn't include an else statement because a non-admin user is not allowed to patch their own paid status.

Lastly, and still frustrating but certainly the most amusing bug, was one I solved before getting into the current_user issues described above. I noticed that my edit and add events worked for all parameters with the notable exception of the time which was always 15:06! With some assistance, it was eventually discovered that I had added a line to format the date in the serializer which, I learned, formated the date once and returned the same string every time after that! It was a learning experience!

Unsolved problems: I want to add some validations on the backend to require certain paramaters, but not others. I would also love to explore more formal, robust ways to have different admin privileges for different users.

ERD: https://i.imgur.com/e5llgZK.jpg

The Github repository for the client side of this application is located at: https://github.com/hollyklose/Hash-House-Harriers-client

Deployed API: https://sleepy-atoll-90720.herokuapp.com/
Deployed Client side: https://hollyklose.github.io/Hash-House-Harriers-client/
