#!/usr/bin/env bash
#
# Commit Bot by Yigithan Saglam
#
message="Commit made at: $(date)"
echo "Detected Operating System: $OSTYPE"

if [[ "$OSTYPE" == "darwin"* ]]; then
    script_dir=$(dirname "$0")
elif [[ "$OSTYPE" == "linux"* ]]; then
    script_dir=$(dirname "$(readlink -f "$0")")
else
    echo "This Operating System is not supported (please raise an issue on GitHub!)"
    exit 1
fi

cd "${script_dir}" || exit 1
# Array of possible commit times
commit_times=(0 1 2 3 4 0 5 6)

# Random selection of commit times
selected_time=${commit_times[$RANDOM % ${#commit_times[@]}]}

# Repeat the commit process for the selected number of times
for ((i=1; i<=selected_time; i++));
do
    echo "$info - Commit number $i" >> output.txt
    echo "$info - Commit number $i"
    echo

    # Ship it
    git add output.txt
    git commit -m "$info - Commit number $i"
done

# Finally, push the commits to the remote repository
git push origin main # or "master" on old setups

cd -
