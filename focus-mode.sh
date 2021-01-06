#/bin/zsh
# Focus mode, v0.1

# Simple script to quit Slack, Mail

# osascript -e 'quit app "Slack"'
# osascript -e 'quit app "Canary Mail"'

LOG_DIR=/var/log
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
ENTER_ARG=enter
EXIT_ARG=exit 

# Run as root.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi 

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
  state=$1
fi

if [ $state = "enter" ]
then
  osascript -e 'quit app "Slack"'
  osascript -e 'quit app "Canary Mail"' # TODO should figure out default Mail app, write a function instead
  echo "Entering focus mode..."
fi

if [ $state = "exit" ]
then 
  osascript -e "tell application \"Slack\" to activate"
  osascript -e "tell application \"Canary Mail\" to activate" # TODO should figure out default Mail app, write a function instead
  echo "Exiting focus mode..."
fi

echo $state