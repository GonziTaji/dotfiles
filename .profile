if  command -v uwsm && uwsm check may-start && uwsm select; then
	exec uwsm start default
fi
