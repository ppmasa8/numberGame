#!/bin/zsh
randomNumber=$(($RANDOM % 10 ))
lpBreak=false;
cnt=0;

checkNumber(){
  if [ $receiveNumber -gt $randomNumber ] ; then
    echo "${receiveNumber} is bigger than answer"
    cnt=$((cnt+1))
  elif [ $receiveNumber -lt $randomNumber ] ; then
    echo "${receiveNumber} is smaller than answer"
    cnt=$((cnt+1))
  elif [ $receiveNumber -eq $randomNumber ] ; then
    echo "${receiveNumber} is answer!!, Your number of attempts are ${cnt}"
    lpBreak=true
  fi
}

while true
do
  read -p "Please input number:" receiveNumber

  if [[ ${receiveNumber} =~ ^[0-9]+$ ]] ; then
    checkNumber
    if $lpBreak ; then
      break
    fi
  else
    echo "Do not enter anything but numbers"
  fi
done
