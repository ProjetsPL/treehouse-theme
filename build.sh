#!/usr/bin/env bash
cd international;
bundle exec jekyll build;

cd ../pl;
bundle exec jekyll build;
exit;
