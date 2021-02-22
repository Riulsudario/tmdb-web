
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

## TMDB Web
> An example project to use the themoviesdb gem with several other features!

![TMDB Web Screen Shot](https://i.imgur.com/vfIJbue.jpg)

Ruby on Rails app created using [`themoviedb`](https://github.com/ahmetabdi/themoviedb) gem for consuming [The Movie DB Api](https://developers.themoviedb.org/3).

### Built With


* [Ruby on Rails](https://rubyonrails.org/)
* [JQuery](https://jquery.com)

<!-- GETTING STARTED -->
## Getting Started
The project has integration with [Amazon S3](https://docs.aws.amazon.com/s3/index.html?nc2=h_ql_doc_s3) for uploading user avatar and [Facebook authentication](https://developers.facebook.com/docs/facebook-login/), so you need to configure external products for the complete project experience.

### Prerequisites

You need to have ruby on rails installed on your machine. Follow steps: https://rubyonrails.org/

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/riulsudario/tmdb-web.git
   ```
2. Install gems
   ```sh
   bundle install
   ```
3. Install webpacker and jquery packages
   ```sh
   yarn install
   ```
4. Create your `master.key` credentials for saving the secrets
   ```sh
   EDITOR=nano rails credentials:edit
   ```
5. Add your secrets
   ```sh
    default_server_config: & default_server_config
      aws_s3:
        access_key_id: 'your_amazon_key_id'
        secret_access_key: 'your_amazon_secret_key'
        bucket_name: 'your_bucket_name'
        aws_region: 'your_amazon_bucket_region'
      tmdb_api_key: 'your_tmdb_api_key'
      facebook_app_id: 'your_facebook_app_id'
      facebook_api_key: 'your_facebook_api_key'

    development:
      app_domain: 'localhost:3000'

      <<: *default_server_config
   ```
6. Edit `config/database.yml` with your mysql user informations

7. Create database and run migrations
   ```sh
    rails db:create db:migrate
   ```

8. Run app and enjoy
   ```sh
    rails server
   ```

9. For a better experience, install [redis-server](https://redis.io/) and run sidekiq :star:

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/riulsudario/tmdb-web/issues) for a list of proposed features (and known issues).


## Features
 - Registration and Login within the application:
    - For registrations: `name, email, avatar (optional), birth date and password`;
    - For login: `email and password`.
 - Registration and Login with Facebook;
 - Manage profiles:
    - An account can have a maximum of 4 profiles;
    - User can delete or create a profile at any time;
    - An profile have just a `name` and `avatar(optional)`;
    - You can change the profile at any time.
  - Dashboard listing the movies on display;
  - Movie search;
  - Movie details:
    - Movie informations;
    - Trailers;
    - Add to watchlist button;
    - Schedule to watch later;
    - Add to watchedlist button;
    - Share the movie details with facebook, twitter or whatsapp;
    - Movie collection;
    - Similar movies.
  - Watchlist:
    - Each profile has a watchlist;
    - You can add any movie to the watchlist at any time.
  - Watchedlist:
    - Each profile has a watchedlist;
    - You can only add a movie to the watchedlist if it is on your watchlist.
  - Suggested movies:
    - A list of movies based on the genres of the movies you have on your watchlist and watchedlist.
  - Schedule movies:
    - You can schedule a movie to watch later if that movie is on your watchlist;
    - The application will send a notification (to the profile) and an email (to the user) 2 hours before the scheduled.
  - Notifications:
    - Just like the watchlist and the watchedlist, each profile has its notifications.

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

Riul Sudário de Souza - rsudario47@gmail.com

Project Link: [https://github.com/riulsudario/tmdb-web](https://github.com/riulsudario/tmdb-web)

[contributors-shield]: https://img.shields.io/github/contributors/riulsudario/tmdb-web.svg?style=for-the-badge
[contributors-url]: https://github.com/riulsudario/tmdb-web/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/riulsudario/tmdb-web.svg?style=for-the-badge
[forks-url]: https://github.com/riulsudario/tmdb-web/network/members
[stars-shield]: https://img.shields.io/github/stars/riulsudario/tmdb-web.svg?style=for-the-badge
[stars-url]: https://github.com/riulsudario/tmdb-web/stargazers
[issues-shield]: https://img.shields.io/github/issues/riulsudario/tmdb-web.svg?style=for-the-badge
[issues-url]: https://github.com/riulsudario/tmdb-web/issues
[license-shield]: https://img.shields.io/github/license/riulsudario/tmdb-web.svg?style=for-the-badge
[license-url]: https://github.com/riulsudario/tmdb-web/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/riulsudario
