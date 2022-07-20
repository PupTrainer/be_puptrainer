<div align="center">
<h1> Welcome to the PupTrainer Back-End Application! </h1>

## Table of Contents

### [Intro](#intro)
### [Getting Started](#getting-started)
### [Database](#database)
### [Queries](#queries)
### [Mutations](#mutations)
### [The Team](#the-team)
### [The Tech Behind PupTrainer](#tech-behind-puptrainer)

</div>

<br>
<br>

# Database
 <div align="left">
Our PostgreSQL database consists of four different tables.  A Users table, a Dogs table, a DogSkills, and a DogSkills joins table.  The Users table has columns for unique username, unique email, and timestamps.  The Dogs table has columns for name, age, breed, and timestamps.  A User can have many Dogs and a Dog belongs to a User.  The Skills table has columns for level, name, description, criteria, youtube_link, and timestamps.  A Dog can have many Skills through DogSkills, and Skills can have many Dogs through DogSkills. 
 
<img src=/db_schema.png alt=db_schema; " /> 
</div>

<br>
<br>


# Intro
 <div align="left">
This application is the back-end repository for [PupTrainer](https://pup-trainer.herokuapp.com/), the front-end repository can be found [HERE](https://github.com/PupTrainer/fe_puptrainer).  The back-end application was built with a Ruby on Rails API using GraphQL.  The front-end application was built with React using GraphQL.
</div>

<br>
<br>

# Queries
<h3>Fetch User by User ID </h3>
<h5>The fetchUser query can be sent with a user ID as an argument.</h5>
<img src=/1fetchUser(id).png alt=fetchUserID ; " />

<br>
<br>

<h3>Fetch User by Email </h3>
<h5>The fetchUser query can also be sent with a user's email as an argument.</h5>
<img src=/fetchUser(email).png alt=fetchUserEmail ; " />
