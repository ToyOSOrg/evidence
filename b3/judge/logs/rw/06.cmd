gone () 
{ 
    for i in $(seq 1 120);
    do
        pgrep -x bcachefs > /dev/null || { 
            echo daemon-exited-after-${i}s;
            return 0
        };
        sleep 1;
    done;
    echo daemon-still-running;
    pkill -TERM -x bcachefs;
    sleep 3
}; gone
