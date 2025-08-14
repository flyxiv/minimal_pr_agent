#!/bin/bash

version=$1

git tag -a $1 -m "$version release"
git push origin $1

git tag -d v1 
git tag -a v1 -m "Point v1 to $version"  
git push origin :refs/tags/v1  
git push origin v1  
