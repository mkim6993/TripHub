### TripHub

### Summary

Our product is mainly about provide a easy and convenient way for people to make travel plan and form groups with people who have same interests. For users who want to travel to a new place or are already arrive there and would like to make a trip plan. They can use our product to search the wonderful places and events, check other users' post, form group with other users, and then post their own posts after the trip.

### Trello Link

https://trello.com/w/team6784/home

### Heroku Link

https://infinite-coast-27462.herokuapp.com/

### Preliminary Teammate Interests

Cole Feuer: primarily backend  
Jason Tigas: full stack
Min Sung Kim: primarily frontend  
Hiro Chen: probably the app UI design.

### Explanation of Schema

#### "Hello World" Version

-   user accounts
-   create trip posts
-   basic trip planner
-   view public trips
-   rating trips
-   followers/following
-   address validation
-   event pages

#### Example Models

User\_  
user_id: varchar  
username: text  
password: text  
age: integer  
//public: boolean  
followers: [user_id]  
following: [user_id]  
upvoted_trips: [trip_id]  
trip_invites: [trip_id]

---

Trip\_  
trip_id: varchar  
created_by: user_id  
date_created: date  
trip_date: date  
title: text  
description: text  
locations: { location_id, time, votes } // used to handle trip merge  
upvotes: integer  
shares: integer  
public: boolean  
invited_members: [user_id]  
who_liked: [user_id]

---

Location\_  
location_id: varchar  
name: text  
description: text  
address: text  
contact: text  
price: text(' '-$-$$$)  
images: [...]  
open_times: {...}

---

Trip_Location\_
trip: trip_id
location: location_id

---

User_Trip\_

---

star
pk
fk user_id
fk user_id

MinSung:  
I like eating fruit. Fruit are sweetie. No cavity. Good in the morning, good at noon, right into my mouth.

Hirochen:  
Hi there! I have two cats one named Taro and another one named Nezha. 

Cole:  
\>:/

Jason:
Jason Tigas
