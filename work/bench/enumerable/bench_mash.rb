# vim: sw=2 ts=2 ft=ruby expandtab tw=0 nu syn=on:
# file: accumulator.rb

require 'facets'
module Enumerable
  alias_method :facets_mash, :mash
end
require 'benchmark'
$:.unshift File.join( %w{ /home robert SW facets-2.4.1 lib } )
require 'facets/enumerable/mash1'
module Enumerable
  alias_method :robert_mash, :mash
end


x = [*1..100]
N = 10_000

Benchmark::bmbm do |bm|
  bm.report("facets: mash") do 
    N.times do
      x.facets_mash{ |i| i*i }
    end
  end
  bm.report("robert: mash") do 
    N.times do
      x.robert_mash{ |i| i*i }
    end
  end
end

__END__

Rehearsal ------------------------------------------------
facets: mash   8.510000   0.010000   8.520000 (  9.293367)
robert: mash   8.470000   0.000000   8.470000 (  8.626128)
-------------------------------------- total: 16.990000sec

                   user     system      total        real
facets: mash   8.210000   0.020000   8.230000 (  9.608032)
robert: mash   8.530000   0.000000   8.530000 ( 15.996469)
