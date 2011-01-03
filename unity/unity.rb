# Unity build
require 'YAML'

prefs = YAML::load(DATA)

cpp = String.new

Dir.glob(prefs["cpp_files"]).each do |fn|
	next if (File.basename(fn) == File.basename(prefs["target"]))
	cpp << "#include \"#{File.basename(fn)}\"\n"
end

File.open(prefs["target"], 'w')  { |c| c.write prefs["source"].gsub('#unity', cpp) }

__END__
cpp_files: example/App*.cpp
target: example/Unity.cpp
source: // Example, Copyright A. User 2011

        #unity
