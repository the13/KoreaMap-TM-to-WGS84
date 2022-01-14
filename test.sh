#!/bin/sh


rm -f test/*.json

cp $1 test/state.json

open http://localhost:8000/test
python -m SimpleHTTPServer 8000
