# UNL Reservations

UNL reservation system for schedule resources, classes, etc.

## Quick Tutorial

1. Service spaces refer to different silos of the University that will utilize resources. E.g. the math department, the Honors program, or University Communication.
2. Super Admins of a space can do anything, including giving others access and privileges to the space.
3. Resources are created, and then may be reserved by anyone who has the User Access privilege in the space.
4. Events _may_ include a resource reservation but do not have to.
5. Admins with the right privilege can set the _hours_ of the space, which indicate when reservations can be made.
6. The agenda is a quick overview of the day for Admins to look at.

## Installation Local

0. Run `xcode-select --install`. Congratulations, you have saved yourself 5000 insanity points.
1. Get the right ruby on your machine. UNL Resource Scheduler currently runs on Ruby 2.6.10. Get RVM on your machine with `\curl -sSL https://get.rvm.io | bash`.
2. Now using RVM, install the ruby with `rvm install 2.6.10`.
3. You probably do not have the `bundler` gem. Check with `bundle`. If not, install it with `gem install bundler`.
4. In the project root, install the gems using `bundle install`.
5. Create a mysql database you'd like to use, you can typically use one on your computer. `brew install mysql` if necessary.
6. `config/config.json` is a committed file, and a template for the configuration. Create a copy in the same directory named `server.json` and edit it to match your database. You will also need to include your site keys for google reCaptcha which can be generated at [https://www.google.com/recaptcha/](https://www.google.com/recaptcha/) for the V2 checkbox.
7. Your database is currently blank. Install database schema by running `./data/db_2024_12_17.sql` and any updates greater than `0006`.
8. Install the WDN Framework into the `public/wdn` directory...see [WDN Documentation](http://wdn.unl.edu/documentation).
9. Start the server by going to the root directory and doing `bundle exec shotgun -o 0.0.0.0 -p 9393`. This launches the server on localhost port 9393, listening everywhere (you can use your iimlemburg.unl.edu or whichever), and the server will automatically update to new code. If you add gems to the bundle, you will need to re-execute this command.
10. Navigate to `localhost:9393/` or similar and begin!

### Less

I couldn't get Guard to work for me locally so I also added a npm version of less complication

The traditional way to compile less `bundle exec guard`

The NPM way to compile less

1. Run `npm ci` to install less
2. Run `npm run less` to compile less

### Local Email Testing

A quick way to test emails without having to set up email stuff is to run a SMTP debug server in python

`sudo python -m smtpd -n -c DebuggingServer localhost:25`

## Installation on server

1. Run `sudo -u {user} -s` run commands as a user and navigate to your project's root
2. Run `cp ./config/config.json ./config/server.json` to copy config file and customize it to your environment
3. Run `ln -s {path to WDN Templates} {path to project root}/public/wdn` to symlink WDN Templates to your project
4. Run `/bin/bundler install` to install dependencies
   1. You might need to run `/bin/bundle config set --local path 'vendor/bundle'`
5. Install database schema by running `./data/db_2024_12_17.sql` and any updates greater than `0008`
6. You will need to get a service running for unicorn using systemd
   1. Run `cp ./startup.sh.sample ./startup.sh` and customize file for your domain and sock
   2. Run `cp ./unicorn.rb.sample ./unicorn.rb` and customize file for your domain and sock
   3. Run `mkdir -p ~/.config/systemd/user` to set up systemd user directory
   4. Run `cp ./unicorn.service.sample ~/.config/systemd/user/unicorn.service` and customize file for your domain and sock
7. Run `systemctl --user start unicorn` to start the service
8. Run `systemctl --user enable unicorn` to start the service on boot

## Deploying Updates on Production/Staging

1. SSH into server and switch to site's user `sudo -u {USER} -s`
2. Run `git pull origin master` to pull latest changes
3. Update database using SQL files in `./data/updates`
4. Update any gems using `bundle install`
5. Restart unicorn `systemctl --user restart unicorn`
6. Double check service is running `systemctl --user status unicorn`
7. Check for errors `journalctl --user -u unicorn -f`

### Other helpful commands

- Starting unicorn `systemctl --user start unicorn`
- Stopping unicorn `systemctl --user stop unicorn`
- Start unicorn on boot `systemctl --user enable unicorn`
- Don't start unicorn on boot `systemctl --user disable unicorn`
- Check if unicorn is enabled `systemctl --user is-enabled unicorn`
- Update systemctl when changes made to service file `systemctl --user daemon-reload`

## CRON

```text
0 12 * * * ruby ././scripts/email_expiring_users.rb
0 12 * * * ruby ././scripts/email_unconfirmed_trainers.rb
0 22 * * * ruby ././scripts/email_expiring_users_vehicle_update.rb
```
