require "../src/base32"

arg = ARGV.shift? || abort "missing max number"
max = arg.to_i64? || abort "invalid i64 [#{arg}]"

(1..max).each do |v|
  Base32.encode(v)
end
