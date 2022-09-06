# 🔎 JobJob

A job application management app.

![jobjob2](https://user-images.githubusercontent.com/107089457/188589670-a4c58d10-6662-41b2-8b86-66e42e0e03dd.jpg)
![jobjob3](https://user-images.githubusercontent.com/107089457/188589679-a9413c90-2619-4430-8a69-1c6a513009fa.jpg)
![jobjob4](https://user-images.githubusercontent.com/107089457/188589708-a70735c2-38a5-4112-b73f-d3a9fce2932f.jpg)

<br>
App home: https://www.jobjob.pro/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Adam Hemming](https://github.com/lw-a)
- [Malene Thisgaard](https://github.com/mthisgaard)
- [Andre Paul Bauer](https://github.com/BauerAndre)
- [Nikki Carlos](https://github.com/nrcrls)

## Project Management && Contributing
- [Trello](https://trello.com/b/MfGzTQUy/jobjob)
- [DB Schema](https://kitt.lewagon.com/db/74000)
