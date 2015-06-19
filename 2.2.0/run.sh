#!/bin/bash

if [ ! -f /.plugin_setup ]; then
	/setup_plugin.sh
fi

/usr/sbin/td-agent $@
