../dtrace -n '
fbt:test:procfile_read:entry
{
	printf("%s	", execname);
	printf("%lu\n", (uint64_t)arg2);
	printf("%p\n", (char *)arg0);
}'
