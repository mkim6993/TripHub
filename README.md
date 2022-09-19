### TripHub

### Summary

Our product is mainly about provide a easy and convenient way for people to make travel plan and form groups with people who have same interests. For users who want to travel to a new place or are already arrive there and would like to make a trip plan. They can use our product to search the wonderful places and events, check other users' post, form group with other users, and then post their own posts after the trip.

### Trello Link

https://trello.com/w/team6784/home

### Preliminary Teammate Interests

Cole Feuer: primarily backend  
Jason Tigas:  
Min Sung Kim: primarily frontend
Hiro Chen: probably the app UI design.

### Explanation of Schema

"Hello World" Version

-   user accounts
-   create trip posts
-   basic trip planner
-   view public trips
-   rating trips
-   followers/following
-   address validation
-   event pages

example models
User\_  
user_id: varchar  
username: text  
password: text  
age: integer  
____
UserInfo\_  
user_id: varchar  
username: text  
//public: boolean  
followers: [user_id]    
following: [user_id]  
upvoted_trips: [trip_id]  
trip_invites: [trip_id]  
____
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
____
Location\_  
location_id: varchar  
name: text  
description: text  
address: text  
contact: text  
price: text(' '-$-$$$)  
images: [...]  
open_times: {...}  

...
