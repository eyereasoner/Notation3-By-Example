find user-defined-trust/data/ -type f | xargs eye --nope --quiet --blogic --restricted  query/query-data.n3 user-defined-trust/rules/run1/*.n3 >> output/run1.n3

# eye --nope --blogic  output/run1.n3 user-defined-trust/rules/run2/*.n3 >> output/run2.n3