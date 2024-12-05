echo "STOP! STOP! STOP! If you are running this DIRECTLY without using the Makefile, YOU CAN AND WILL DESTROY DATA!"
echo "Press Ctrl-C now if you are NOT using the MAKEFILE!"
#echo "Starting in 5 seconds"
#sleep 5
read -p "Enter drive to write to (/dev/sda): " answer
sudo dd if=myos.iso of=$answer && sync
echo Flash complete!
