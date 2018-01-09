task :delete_cassettes => :environment do
  cassettes = (Dir['fixtures/vcr_cassettes/*.yml'].map { |d| File.expand_path(d) } )
  cassettes.each { |v| File.delete(v) }
end