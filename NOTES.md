Sinatra Portfolio Project
Portfolio Checklist

Congratulations on making it to your Sinatra Portfolio! Here’s a checklist to help you get done with your project within 3-4 days.
Make sure to gem install corneal. For more details on how to use corneal, you can go to https://github.com/thebrianemory/corneal. We’ll be using corneal to create the project.
Tips on using corneal:
To create a new project using corneal, type in the terminal corneal new project_name. This will create the project for you. After it creates the project, cd into your project and bundle install.
To create a new model / migration all at once, type in the terminal: corneal model model_name. This will automatically generate a model and a migration file in your migrate directory in db. All you need to do is fill out your migration file as well as the model for any associations you might have.


Requirements for Sinatra Project

Build an MVC Sinatra Application
Use Activerecord with Sinatra
Use Multiple Models
Use at least one has_many relationship / belongs_to relationship
Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
Must have the abilty to create, read, update and destroy any instance of the resource that belongs to a user.
Ensure that any instance of the resource that belongs to a user can be edited or deleted only by that user.
You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user.
(optional) Try to make multiple git commits. (A commit for every feature you add). It’s good practice!


Day 1
Come up with an idea for your project.
Create your Sinatra Project.
Create your repo on github and connect the two together. (Use your google skills if you forgot how to do this!)
(Optional) Create a NOTES.md, this file will be used to brainstorm on how things will be associated, the different routes, and anything you would want to write for notes.
Create your user model / controller and wire it up with being able to sign up, log in, and log out.
Make sure bcrypt is added to the gemfile, if it’s not add it and bundle install and use bcrypt as you had learned in the lessons for user authentication and password encryption.


Day 2
Create another model(s) / controller(s) as something a user would own.
Wire up the associations
Work on index views example: get /resources as well as a show route example: get /resources/:id


Day 3
Continue if not finished off of Day 2.
Finish restful routes and CRUD
Work on protecting user data. Make sure the user can only update and destroy it’s own resources. This should be both in the view and in the controller.


Day 4
Test out your project to make sure it works as intended. Do any last minute touch ups to it if needed.
(optional) Pair with someone to practice speaking about your website and going over what you did to create it.
(optional) Add some styling using a styling framework such as materialize css.

RESTful Routes

HTTP Verb           Route
get                 /recipes
get                 /recipes/new
post                /recipes
get                 /recipes/:id
get                 /recipes/:id/edit
patch               /recipes/:id
delete              /recipes/:id