#!/bin/bash

syms_table="kallsyms_lookup_name \
modules \
sys_call_table \
access_process_vm \
syscall_call \
print_modules \
task_exit_notifier \
xtime \
ia32_sys_call_table \
old_rsp"
#END_SYMS

function write_syms_table()
{
	for i in ${syms_table}
	do
		#echo $i;
		#echo "---"
		grep -w $i /proc/kallsyms > /dev/fbt
		if [ $? -ne 0 ]; then
			echo "not found $i"
		fi
	done
	#cat end_syms > /dev/fbt
}


insmod dtracedrv.ko arg_kallsyms_lookup_name=`grep -w "kallsyms_lookup_name" /proc/kallsyms | awk '{print "0x" $1}'`
