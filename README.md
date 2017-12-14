# Intervals for Humans

A simple gem for getting human-readable date intervals. For example:

```ruby
interval = IntervalsForHumans::Interval.new(
  Date.parse("1 Jan 2000"),
  Date.parse("6 Mar 2001")
)

puts interval             # => 1 year, 2 months, 5 days
puts interval.components  # => {:year=>1, :month=>2, :day=>5}
```
