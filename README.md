# Database Project Team 2

## Up and running:
First things first, you'll needs Ruby and Rails installed to run the project. If you're on Windows or Mac, RailsInstaller will sort everything out for you. If you're on Linux, prayer is probably your best bet. Once you've done that, and pulled the project, cd into the root folder and:

    bundle install
    rails server

The first ensures you have all the necessary Ruby gems installed, the second starts the server. Oh, and you might also have to run:

    rails db:migrate

That updates your DB schema.

The website should then be up and running at localhost:3000. The index page isn't there yet, but if you go to locahost:3000/students, or locahost:3000/packages, you can see the entities I've made and create/edit/delete them. Let me know if you have questions.

-- Jack