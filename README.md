# README

## Install steps

1. Install Ruby 2.4.1

        rbenv install 2.4.1

2. Install `bundler`

        gem install bundler

3. Copy .example files

        cp config/mailgun.yml.example config/mailgun.yml
        cp config/database.yml.example config/database.yml

4. Run `bin/setup`

        ./bin/setup
