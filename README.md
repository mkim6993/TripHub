### TripHub

### Summary

Our product is a platform that provides an easy and convenient way for people to make travel plans with friends, and see the plans of other people to make visiting new places even more fun. Anyone can use our product to search for places and events near them to build their own trip plan, and get ispiration from other users' trips to see how they structured their day.

### Google Doc Link(We used Google Docs instead of trello to stay organized)

https://trello.com/w/team6784/home

### Heroku Link

https://infinite-coast-27462.herokuapp.com/

### Team Roles

Team 6:

Cole Feuer: full stack, primarily backend  
Jason Tigas: full stack, primarily backend  
Min Sung Kim: full stack, primarily frontend  
Hiro Chen: backend

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


