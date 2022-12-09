### TripHub

### Project description

Our product is mainly about provide a easy and convenient way for people to make travel plan and form groups with people who have same interests. For users who want to travel to a new place or are already arrive there and would like to make a trip plan. They can use our product to search the wonderful places and events, check other users' post, form group with other users, and then post their own posts after the trip.

Our app is based on rails on ruby along with HTML and CSS. Rails are much more manageable and straightforward to read when programming. And using HTML with CSS is to provide an excellent UI for our users. 

The challenges we met are how to attract more users to use our app because, in many client-based new applications, it takes time to acquire users in the beginning. Then after users, we need to provide more functionalities in the future, such as implementing Google map API so we can interact with it and users can easily add map details and locations to their posts; what’s more, we also want to have more API implementation such as, log in or sign up via many other accounts like google or Facebook. Also, it is very important to maintain the stability of our app, reduce the occurrence of errors and make the whole application run smoothly and quickly. 


### Trello Link

https://trello.com/w/team6784/home

### Heroku Link

https://infinite-coast-27462.herokuapp.com/


### How to install


It is easy to install our application. 

First, on the terminal, just clone this GitHub repo below: 

https://github.com/mkim6993/TripHub

Second, open the file just cloned in any editor; VScode is recommended. 

Third, in the terminal, type “bundle install” to install some essential packages. 

Fourth, in the terminal, type “rails server” to activate the application.

Fifth, open a browser and go to the link http://localhost:3000.

Sixth, sit tight and start your journey. 



### How to use

Our application is easy, but most functionalities can only be used after logging in. If  not, there still have some previews of trip posts. So the first step is to create an account with us. It’s easy. Just click the login button and the sign-up button in the middle of the screen. 

After creating an account, users still edit their account by clicking the settings button. See following and followers as well as their trips. 

Then there are some buttons on the header, the trips function can help the users to filter and find their desired trips and then click that trip for trip details, invite users, attend the trips, or create related trips. The My trip button can direct to users’ attended trips or the trips they created. Then there are create a trip and create location buttons which are used to create a location that is not showing up or create a trip that no one created before. But it is important to create the location first and then the trip second. At last, there is a dropdown button for user accounts. The profile can navigate to the user’s profile page, settings can let the user edit their profile page and the brutal log out button. 



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


