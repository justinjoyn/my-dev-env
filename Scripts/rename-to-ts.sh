ls ./src/**/*.js | while read line; do git mv -- $line ${line%.js}.ts; done;

find ./src -type f -name "*.ts" |
    xargs grep 'import React[ ,]' |
    cut -d: -f1 |
    uniq |
    while read line; do git mv -- $line ${line%.ts}.tsx; done;

for f in src/**/*.ts; do echo "// @ts-nocheck\n$(cat "$f")" > "$f"; done;