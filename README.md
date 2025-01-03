# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two processes attempt to increment a shared counter concurrently, leading to unpredictable results. The solution demonstrates how to use appropriate locking mechanisms to prevent this race condition.  The bug is present in `bug.sh`, while the solution is in `bugSolution.sh`.