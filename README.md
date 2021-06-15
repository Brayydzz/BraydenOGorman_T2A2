## Link to App - https://golf-market-bog.herokuapp.com/
## link to Github - https://github.com/Brayydzz/The-Golf-Pro-Shop

---

## Identification of the problem you are trying to solve by building this particular marketplace app & why is it a problem that needs solving? ##

I recently picked up and started playing golf. I wanted to buy my first set of golf clubs and I didn't want to buy brand new as a whole set can be quite pricey. So I went hunting through places like facebook marketplace and gumtree to find a second hand set. This can be a little frustrating to find individual the golf items I am looking for as these places aren't dedicated golf marketplaces. I also noticed that the sets on these marketplaces were much cheaper than sets found in physical second hand stores. This leads me to believe that a dedicated marketplace for golf lovers to buy, swap, hire and sell second hand golfing equipment and services such as equipment cleaning or lessons would fix the problem I personally had. 

---

# Description of marketplace app and target audience ##

The Pro Shop is a web application that allows users to sign up to and account and list their second hand golfing equipment or services such as coaching, repairs and cleaning for sale for other users to purchase. The target audience for this app is golf lovers who are looking for a cheaper alternative for golfing equipment/services

---
features:

- Users can sign up to an account to list their golf equipment/services
- Users can view all listings of equipment/services
- Latest listed items will be shown on index page
- Listed items will be categorized on a side nav bar
- Users will be able to have full CRUD for their own listings
- Users can message other users via their listings

 ## TECH STACK:

  ### HTML

  ### CSS/Bootstrap

  ### Javascript

  ### Deployment Platform - Heroku

  ### Ruby/Ruby on Rails

  ### Ruby Gems:

  
  - dotenv-rails

  - devise

   - pundit

    - rolify 

    - cloudinary

    - activestorage-cloudinary-service

    - active_storage_validations

    - simple_form

    - mailboxer 

    - kaminari

    - bootstrap 

    - jquery-rails

---
# High-level components

## Users:

To be able to access the main features of my application users are going to have to sign up and register for an account to do so. This will grant them the access to post listings to the application, be able to edit their listings and also get in contact with other listing owners via a direct message. With the use of the Devise and Pundit gem for user authentication and authorization to make sure users are not able to see/edit anything they are not allowed to.

## Equipment Listings:

Equipment listings allow a user to post their golfing equipment for sale. Within a listing a users can add in fields such as a title, description, price, location and are given the ability to upload up to 5 images of their equipment. Anyone who simply visits the site is able to view all of the current listings but in order to create a listing or message the owners of other listings they must sign up and be logged in to an account. Users are able to edit and update their own listings.

## Service Listings:

Service listings are very similar to an equipment listing but instead of selling a piece of equipment. They are a way users can post an advertisement for golfing services such as coaching and club cleaning/repair. Anyone who visits the site is able to view all service listings. But to post their own or message an owner of another listing they must first sign up and be logged into an account. Users are able to edit and update their own listings.

## Messaging:

With the use of the Mailboxer gem, Users are able to directly message other users through their listings. Users are then provided with an inbox to view all of their messages with other users. To message an owner of a listing the user must be sign up and be logged in to an account.

---

# Third Party Services

## Cloudinary:

Cloudinary provides a cloud-based image/video management service which allows its users to upload, store, manage, manipulate and deliver image/videos for websites and apps. With cloudinary I was able to allow users to upload 1 or more images to their listings. With the use of their ruby gems and helper methods I was able to scale and transform images when rendering them on a page to minimize the download size/time. 

## Google Places Autocomplete API:

For this app, I wanted to implement a simple autocomplete form for locations when users are creating a listing. With the use of Google places autocomplete, when a user types anything in the location box it will provide a query prediction, returning suggested location queries based on the input from the user when typing.  

## Heroku:

Heroku is a cloud platform which allows developers to deploy, manage and scale their applications. Heroku also offers git hub integration which allows me to automatically deploy any changes whenever I push anything to my main branch on github. Heroku also offers integration and support for ruby on rails. I am able to access the rails console for my deployed application.

## Bootstrap

Bootstrap is a free and open source CSS framework directed at responsive, mobile-first web development. Bootstrap allowed be to add in some features such as a hamburger menu navbar and an offcanvas category bar with having little to no java-script knowledge.

---