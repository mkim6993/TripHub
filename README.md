### TripHub

### Summary

Our product is mainly about provide a easy and convenient way for people to make travel plan and form groups with people who have same interests. For users who want to travel to a new place or are already arrive there and would like to make a trip plan. They can use our product to search the wonderful places and events, check other users' post, form group with other users, and then post their own posts after the trip.

### Trello Link

https://trello.com/w/team6784/home

### Heroku Link

https://infinite-coast-27462.herokuapp.com/

### Preliminary Teammate Interests

Team 6:
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

#### Models

Article  
name: string
content: text

---

User   
username: string  
password: string
email: string
age: integer  
password_digest: string

---

StarFan  
star_id: integer
fan_id: integer

---

Trip  
create_by: string  
trip_date: date  
title: string  
description: string  
upvotes: integer  
shares: integer  
public: boolean  
parent: integer

---

Location  
name: string  
description: string  
address: string  
contact: string  
price: integer  
images: string
open_times: string

---

Trip_Location  
trip_id: integer
location_id: integer

---

Trip_User  
trip_id: integer
user_id: integer

---

#### To Run Tests:
```rails test```


