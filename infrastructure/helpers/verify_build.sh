#!/bin/bash

if [[ $CHANGE_TARGET == "main" && $CHANGE_BRANCH != "dev" ]]; then
echo "Only dev branch can merge to main"
exit 1
fi

if [[ $CHANGE_TARGET == "dev" && $CHANGE_BRANCH != "test" ]]; then
echo "Only test branch can merge to dev"
exit 1
fi

if [[ $CHANGE_TARGET == "test" && -z $CHANGE_FORK ]]; then
echo "Only pull requests from forks can merge to test"
exit 1
fi