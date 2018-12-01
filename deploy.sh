#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://maden-maxi.github.io
# git push -f git@github.com:maden-maxi/maden-maxi.github.io.git master

# if you are deploying to https://maden-maxi.github.io/vue-open-weather-map
# git push -f git@github.com:maden-maxi/vue-open-weather-map.git master:gh-pages

cd -