Filter=: (#~`)(`:6)
odd =: 2&|
even =: -.@:odd
factors =: [: ([: /:~ [: */"1 ([: x: [) ^"1 [: > [: , [: { [: <@:i.@>: ])/ __ q: ]
digits =: 10&(#.inv)
tally =: # : [:
half =: -: : [:
even_number_of_digits =: even@:tally@:digits
same_digits =: digits@:[ -:&(/:~) ,&digits/@:]
assert 1 -: 1234 same_digits 23 14
assert 0 -: 1234 same_digits 23 140
half_the_digits =: (half@:tally@:digits@:[ = tally@:digits&>@:]) # ]
factors_with_half_the_digits =: half_the_digits factors
large =: (> <.@:%:)~ # ]
candidates =: large factors_with_half_the_digits
one_trailing_zero_permitted =: (0 < [: tally 0 -.~ 10&|)"1 Filter
pairs =: (% ,. ]) one_trailing_zero_permitted@:candidates
fangs =: (same_digits"0 1 # ]) pairs

   A=:(0 2 -.@:-: $)&>Filter<@fangs"0]1000+i.1e4
   B=:(0 2 -.@:-: $)&>Filter<@fangs"0]100000+i.25501
   (,: */@:{.&.>)A,B
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┐
│21 60│15 93│35 41│30 51│21 87│27 81│80 86│201 510│260 401│210 501│204 516│150 705│135 801│158 701│152 761│161 725│167 701│141 840│201 600│231 534│281 443│152 824│231 543│246 510│251 500│
│     │     │     │     │     │     │     │       │       │       │       │       │       │       │       │       │       │       │       │       │       │       │       │204 615│       │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┤
│1260 │1395 │1435 │1530 │1827 │2187 │6880 │102510 │104260 │105210 │105264 │105750 │108135 │110758 │115672 │116725 │117067 │118440 │120600 │123354 │124483 │125248 │125433 │125460 │125500 │
└─────┴─────┴─────┴─────┴─────┴─────┴─────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┘

   <@fangs"0[] 16758243290880 24959017348650 14593825548650
┌───────────────┬───────────────┬──┐
│2817360 5948208│4230765 5899410│  │
│2751840 6089832│4129587 6043950│  │
│2123856 7890480│4125870 6049395│  │
│1982736 8452080│2949705 8461530│  │
│               │2947050 8469153│  │
└───────────────┴───────────────┴──┘

   fangs f.  NB. <laugh>
((10&(#.^:_1)@:[ -:&(/:~) ,&(10&(#.^:_1))/@:])"0 1 # ]) ((% ,. ]) (#~ (0 < [: # :[: 0 -.~ 10&|)"1)@:(((> <.@:%:)~ # ]) (((-: :[:@:(# :[:)@:(10&(#.^:_1))@:[ = # :[:@:(10&(#.^:_1))&>@:]) # ]) ([: ([: /:~ [: */"1 ([: x: [) ^"1 [: > [: , [: { [: <@:i.@>: ])/ __ q: ]))))
