class base::if {
	if $::hostname =~ /^precise(\d+)/ {
		notice("you have arrived @ server $0 ")
	}
}
