# use docker to get ruby
docker run -it -v $(pwd):/app ruby:2.4 sh

# run this inside docker
gem install travis
travis login
travis encrypt-file service-account.json -r gusdecool-study/udemy-docker-complex
