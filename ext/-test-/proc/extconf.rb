# frozen_string_literal: false
$INCFLAGS << " -I$(topdir) -I$(top_srcdir)"
$srcs = Dir[File.join($srcdir, "*.{#{SRC_EXT.join(%q{,})}}")]
inits = $srcs.map {|s| File.basename(s, ".*")}
inits.delete("init")
inits.map! {|s|"X(#{s})"}
$defs << "-DTEST_INIT_FUNCS(X)=\"#{inits.join(' ')}\""
create_makefile("-test-/proc")
