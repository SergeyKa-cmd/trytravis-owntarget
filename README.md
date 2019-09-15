# SergeyKa-cmd_infra

### Working with Travis CI & Github & Slack integration for process monitoring
## Main Goal: correct Python test.py file for passing unit test in Travis CI
# Prerequisites for testing repository:
   + Installation of Ruby and rubygems packages
      
      $ sudo apt install ruby-ful
      
      $ sudo gem install travis
      *See Issues with Ruby installation.
   + Cloned repository from [OTUS Workspace](https://github.com/Otus-DevOps-2019-08/SergeyKa-cmd_infra) to local environment
     
     $ git checkout -b play-travis
   + Created directory .github containing PR Template.md file in ./SergeyKa-cmd_infa folder
     
     $ wget http://bit.ly/otus-pr-template -O PULL_REQUEST_TEMPLATE.md
   + #sergey_karakulanov Slack channel subscribed for Travis CI&Github connectivity
     
     /github subscribe Otus-DevOps-2019-08/<GITHUB_USER>_infra commits:all
   + Placing test file prepared for Travic CI automation process to ./play-travis folder
     
     [test.py](https://raw.githubusercontent.com/express42/otus-snippets/master/hw-04/test.py) - Python test file
 _______________________________________________________________________________________________
*Issues with ruby installation in my environment:
+ for proper installing ruby packets used this command:
 
 $ sudo gem install travis -V
  Also need correct DNS configuration to default 8.8.8.8, 8.8.4.4

# Preparation of Travis CI notification in Slack
 File .travis.yml should contain generated public key ater command:
 $ travis encrypt "devops-team-otus:<token from Travis CI plugin in Slack>#<sergey_karakulanov>"
    \--add notifications.slack.rooms --c

# How to run process
   + Fork repository from [OTUS-DevOps-2019-08](https://github.com/Otus-DevOps-2019-08/SergeyKa-cmd_infra)
   + Preform all manupulations from [Prerequisites section](#Prerequisites for testing repository:)   
   + Make commit to your repository on Github for Slack integration testing
   
# Correct python file test.py
   + Using travis-ci.com need to find error message after test.py in console
   + Correct test.py file and commit again to repo
   + Successfull task will be in green color with no error messages on Slack channel

# Build monitoring in Travis CI environment
[Link](https://travis-ci.com/Otus-DevOps-2019-08/SergeyKa-cmd_infra) - Travis CI Dashboard
