#!/bin/bash


if [[ $TASK = 'npm-test' ]]; then
    npm test
elif [[ $TASK = 'spellintian' ]]; then
  # run the spellchecker only if it is the requested task
  spellingfiles=$(find ./ -type f -and ! \( \
      -wholename "./.git/*" -or \
      -wholename "./node_modules/*" \
      \) | xargs)
  # count the number of spellchecker errors
  spellingerrors=$(zrun spellintian $spellingfiles 2>&1 | \
      wc -l)
  if [[ $spellingerrors -ne 0 ]]; then
    # print the output for info
    zrun spellintian $spellingfiles
    echo "Found $spellingerrors spelling errors"
    exit 1;
  else
    echo "Found $spellingerrors spelling errors"
  fi;
elif [[ $TASK = 'codespell' ]]; then
  # run codespell only if it is the requested task
  spellingfiles=$(find ./ -type f -and ! \( \
      -wholename "./.git/*" -or \
      -wholename "./node_modules/*" \
      \) | xargs)
  # count the number of codespell errors
  spellingerrors=$(zrun codespell --check-filenames --quiet 2 --regex "[a-zA-Z0-9][\\-'a-zA-Z0-9]+[a-zA-Z0-9]" $spellingfiles 2>&1 | wc -l)
  if [[ $spellingerrors -ne 0 ]]; then
    # print the output for info
    zrun codespell --check-filenames --quiet 2 --regex "[a-zA-Z0-9][\\-'a-zA-Z0-9]+[a-zA-Z0-9]" $spellingfiles
    echo "Found $spellingerrors spelling errors via codespell"
    exit 1;
  else
    echo "Found $spellingerrors spelling errors via codespell"
  fi;
fi
