echo -e "\n\nHello, $USER, my dear future colleague!\n\nMy name is Anton Nadtochii.\n\nIt's only $(date "+%H:%M"), so let's have some fun!\n\nOur working directory is $(pwd).\n\nFirst, we'll create a directory.\n\nHow should we name it?\n"
read directory_name
mkdir $directory_name
echo -e "\nDone! Here's what's inside our working directory now:\n\n"
ls
sleep 2
echo -e "\n\nNow let's fill our new folder with some files, shall we?\n\nHow many files should I create?\n"
read files_number
echo -e "\nHow should I name them?\n"
read files_name
for ((i = 1 ; i < $files_number + 1; i++)); do
  touch "$directory_name/$files_name$i"
done
echo -e "\nDone!\n\nFolder $directory_name now contains:\n\n"
ls $directory_name
sleep 2
echo -e "\n\nNow let's move all our files to another directory!\n\nHow should I name the new directory?\n"
read directory_name2
mkdir $directory_name2
echo -e "\nDirectory created!\n\nHere's what's inside our working directory now:\n\n"
ls
sleep 2
echo -e "\n\nMoving files...\n"
mv $directory_name/* $directory_name2
echo -e "Done\n\nFolder $directory_name2 now contains:\n\n"
ls $directory_name2
sleep 2
echo -e "\n\nFolder $directory_name is empty!\n\nMaybe we should copy files from directory $directory_name2 to directory $directory_name? (Y/N)\n"
read answer
sleep 2
echo -e "\nYou know what? Let's do this anyway! Just for fun!"
cp $directory_name2/* $directory_name
sleep 2
echo -e "\nDone\n\nFolder $directory_name now contains:\n\n"
ls $directory_name
sleep 2
echo -e "\n\nBut do we really need 2 folders with same files?\n"
sleep 2
echo -e "Let's delete one of them!\n\nPlease type the name of directory I should delete:\n"
while true
do
  read to_delete
  if [ "$to_delete" != "$directory_name" ] && [ "$to_delete" != "$directory_name2" ]
  then
    echo "Incorrect input! Try again:"
  else
    if [ "$to_delete" == "$directory_name" ]
    then
      existing_directory=$directory_name2
    else
      existing_directory=$directory_name
    fi
    break
  fi
done
rm -rf $to_delete
echo -e "\nFolder deleted!\n\nHere's what's inside our working directory now:\n\n"
ls
sleep 2
echo -e "\n\nBut enough of empty file manipulations!\n\nI can see you're bored already.\n"
sleep 2
echo -e "Let's create one more file and add some text to it!\n\n"
touch text.txt
ls
sleep 2
echo -e "\n\nAnd here it is: text.txt is now created! Time to fill it up.\n"
sleep 2
echo -e "Type in the lines you would like to add and press enter key.\n\nWhen you're finished just type in 0 and press enter!\n"
while true
do
  read user_line
  if [ "$user_line" != "0" ]
  then
    echo "$user_line">>text.txt
  else
    break
  fi
done
echo -e "\nVery well! Now let's have a look inside and see what our file contains:\n"
cat text.txt
sleep 2
echo -e "\nImpressive! $(wc -l < text.txt | bc) lines, $(wc -w < text.txt | bc) words and $(wc -m < text.txt | bc) characters total.\n"
sleep 5
echo -e "So here's the list of files and folders that\nwe've created during the last five minutes:\n\n"
find . -Bmin -5
FILES="$existing_directory/*"
counter=-1
for f in $FILES
do
  if [ $counter -gt 0 ]
  then
    echo "some_random_text">$f
  fi
  counter=$((counter * -1))
done
sleep 5
echo -e "\n\nI have written some_random_text in half of the files in $existing_directory folder.\n"
sleep 1
echo -e "Let's find them!\n\nHere's the list of files containing my message:\n\n"
grep -Rl "some_random_text" $existing_directory/ | xargs -L 1 basename
sleep 5
echo -e "\n\nNow let's ping Google servers a few times!\n\nWork in progress..."
ping -c 5 google.com > ping.txt
echo -e "\nDone! Results in ping.txt file.\n\nHere's the summary:\n"
tail -2 ping.txt
sleep 5
echo -e "\nCan you feel it? Something's happening to the computer! (Y/N)\n"
read answer
clear
sleep 5
echo -e "See? All terminal outputs gone!\n\nLet me think...\n"
sleep 2
kill 666
echo -e "\nNo such process... Okay then.\n"
sleep 2
echo -e "Let's investigate!\n\nHere are 5 most CPU intensive processes:\n"
ps aux -r | head -6
sleep 2
echo -e "\nOk, everything seems fine.\n"
sleep 5
echo -e "Let's move on!\n\nWe can do some API testing.\n\nLet's find us a pet in the petstore DB!\n"
curl -X 'GET' 'https://petstore.swagger.io/v2/pet/2000' -H 'accept: application/json'
sleep 2
echo -e "\n\nTom! What a nice name! Let's place an order!\n"
curl -X 'POST' \
  'https://petstore.swagger.io/v2/store/order' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": 0,
  "petId": 2,
  "quantity": 1,
  "shipDate": "2023-05-07T12:14:13.666Z",
  "status": "placed",
  "complete": true
}'
echo -e "\n\nI'm excited! We've successfully placed an order!\n"
sleep 2
echo -e "Seems like we make up a good team.\n\nThat's all for today.\n\nFeel free to contact me if you want to have more fun together!\n"
