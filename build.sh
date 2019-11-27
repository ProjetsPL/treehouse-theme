#!/usr/bin/env bash
cd _international;
bundle exec jekyll build;

cd ../pl;
bundle exec jekyll build;
exit;
