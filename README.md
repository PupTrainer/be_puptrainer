<div align="center">
<h1> Welcome to the PupTrainer Back-End Application! </h1>

## Table of Contents

### [Intro](#intro)
### [Getting Started](#getting-started)
### [Database](#database)
### [Queries](#queries)
### [Mutations](#mutations)
### [Tech](#tech)
### [The Team](#the-team)

</div>

<br>


# Intro

This application is the back-end repository for [PupTrainer](https://pup-trainer.herokuapp.com) , the front-end repository can be found [HERE](https://github.com/PupTrainer/fe_puptrainer) .  The back-end application was built with a Ruby on Rails API using GraphQL.  The front-end application was built with React using GraphQL.  The back-end is also deployed to Heroku, and can be found [HERE](https://pup-trainer-api.herokuapp.com)


<br>

# Getting Started

<div align="left">
This app uses Ruby version 2.7.2 and Rails version 5.2.8.  To access the endpoints via localhost please ensure you have both of these versions installed locally.  Clone the repo down to your machine. In your command line run `bundle install` next run `rails db:create` then `rails db:seed`. after that running `rails s` should start your local server (port 3000), and the endpoints will be available at localhost:3000/graphql.  If you run into any issues, run `rails db:reset` then try `rails s` again.  In your browser, if you visit localhost3000/graphiql, GraphQL's in-browser GUI will allow you to enter the queries and mutations and see the response. 
 

 
 
 
</div>

# Database
 <div align="left">
Our PostgreSQL database consists of four different tables.  A Users table, a Dogs table, a DogSkills, and a DogSkills joins table.  The Users table has columns for unique username, unique email, and timestamps.  The Dogs table has columns for name, age, breed, and timestamps.  A User can have many Dogs and a Dog belongs to a User.  The Skills table has columns for level, name, description, criteria, youtube_link, and timestamps.  A Dog can have many Skills through DogSkills, and Skills can have many Dogs through DogSkills. 
 
<img src=/db_schema.png /> 
</div>

<br>

# Queries
<div align="center">
 
<h2>All Queries can return any of the shown fields, or if the fields are not needed in the response, simply do not include them in the request.  Our queries are set up to allow for any relationships to be returned in the response.</h2>
 
 </div>

<h3>Fetch User by User ID </h3>
<h5>The fetchUser query can be sent with a user ID as an argument.</h5>
<img src=/1fetchUser(id).png />

<br>


<h3>Fetch User by Email </h3>
<h5>The fetchUser query can also be sent with a user's email as an argument.</h5>
<img src=/fetchUser(email).png />

<br>


<h3>Fetch Dog </h3>
<h5>The fetchDog query takes an argument of a Dog's ID</h5>
<img src=/fetchDog.png />

<br>

<h3>Fetch Skill </h3>
<h5>The fetchSkill query takes an argument of a Skill's ID</h5>
<img src=/fetchSkill.png />

<br>

<h3>Fetch Skills </h3>
<h5>The fetchSkils query returns all Skills in the database</h5>
<img src=/fetchSkills.png />

<br>

# Mutations
<div align="center">
 
<h2>All Mutations can also return any of the shown fields, or if the fields are not needed in the response, simply do not include them in the request.  Our Mutations are set up to allow for any relationships to be returned in the response.</h2>
 
 </div>
 
<br>

<h3>Create User</h3>
<h5>The createUser mutation requires a unique email and a unique username.  If a user already exists with the given email and username, the request will return that original user.  The request can also include a users dogs and dog skills if put into the request.</h5>
<img src=/createUser.png />

<br>

<h3>Create Dog</h3>
<h5>The createDog mutation requires a name, age, and breed, all of which will be returned in the response.  If the request includes a User and their attributes, those attributes will also come back in the response.</h5>
<img src=/createDog.png />

<br>
 
 <h3>Add Dog Skill</h3>
<h5>The addDogSkill mutations takes three arguments, dogId, skillId, and passed.  Passed should be set as false.  This mutation is to add a skill to an individual dog, so the user can start the training process.  The response includes all DogSKill attributes.</h5>
<img src=/addDogSkill.png />

<br>
 
 <h3>Pass Dog Skill</h3>
<h5>The passDogSkill mutation is used when a dog has 'passed' the skill given.  The request takes two arguments, Dog ID and Skill ID.  The response includes the dogSkill ID, the Dog's ID, and the Skill's ID</h5>
<img src=/passDogSkill.png />

<br>

# Tech

<div align="center">  


</br>
 <img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/rails-original-wordmark.svg" alt="Ruby on Rails" height="70" />  
 <img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/ruby-original-wordmark.svg" alt="Ruby" height="70" />  
 <img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/postgresql-original-wordmark.svg" alt="PostgreSQL" height="70" /> 
 <img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/graphql.png" alt="GraphQL" height="70" />  
 <img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/git-scm-icon.svg" alt="Git" height="70" /> 
 </div>
 
 
 <div align="center">  

<h2> 🛠 &nbsp; Tools</h2> 

  <br>
  
![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Markdown](https://img.shields.io/badge/markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)
![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)

</div>
 
 
 
 
 
# **The Team ✨**

Thanks go to these wonderful people (![emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>

  <tr>


   <td align="center"><a href="https://github.com/Josenecal"><img src="https://avatars.githubusercontent.com/u/70451678?v=4" width="100px;" alt=""/><br /><sub><b>Joesph S. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/joseph-senecal-3947a9232/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/PupTrainer/be_puptrainer/commits?author=Josenecal" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/PupTrainer/be_puptrainer/pulls?q=is%3Apr+author%3Josenecal" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/psitosam"><img src="https://avatars.githubusercontent.com/u/95240894?v=4" width="100px;" alt=""/><br /><sub><b>Alex P. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/alex-psitos-5429a1232/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/PupTrainer/be_puptrainer/commits?author=psitosam" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/PupTrainer/be_puptrainer/pulls?q=is%3Apr+author%3Apsitosam" title="Reviewed Pull Requests">👀</a></td>

   <td align="center"><a href="https://github.com/alexGrandolph"><img src="https://avatars.githubusercontent.com/u/96802470?v=4" width="100px;" alt=""/><br /><sub><b>Alex R. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/alexgrandolph/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/PupTrainer/be_puptrainer/commits?author=alexGrandolph" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/PupTrainer/be_puptrainer/pulls?q=is%3Apr+author%3AalexGrandolph" title="Reviewed Pull Requests">👀</a></td>


   <td align="center"><a href="https://github.com/AliciaWatt"><img src="https://avatars.githubusercontent.com/u/81201783?v=4" width="100px;" alt=""/><br /><sub><b>Alicia W. (she/her)</b></sub></a><br /><a href="https://www.linkedin.com/in/alicia-watt-3bb815225/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/PupTrainer/be_puptrainer/commits?author=AliciaWatt" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/PupTrainer/be_puptrainer/pulls?q=is%3Apr+author%3AAliciaWatt" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--
 

 
 
 
 
