#!/bin/sh

set -e

./bin/lein_prefer deps

echo "Starting Dev Build"

./bin/lein_prefer cljsbuild once dev

echo "Finalizing mori.dev.js"

(cat support/wrapper.beg.txt; cat mori.bare.js; cat support/wrapper.end.txt) > mori.dev.js

echo "Starting Release Build"

rm mori.bare.js

./bin/lein_prefer cljsbuild once release

echo "Finalizing mori.js"

(cat support/wrapper.beg.txt; cat mori.bare.js; cat support/wrapper.end.txt) > mori.js

echo "Deleting mori.bare.js"

rm mori.bare.js

echo "Build finished."