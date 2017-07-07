#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

rm -rf out
mkdir out

# config
git config --global user.email "lch34677@gmail.com"
git config --global user.name "Non-Contradiction"

# build (CHANGE THIS)
jupyter nbconvert Lecture*.ipynb --to slides --output-dir ./out

# deploy
cd out
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1
