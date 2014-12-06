if [ $1 == 'lab' ]
then
   git push -u origin master
elif [ $1 == 'hub' ]
then
   git push --mirror github
else
   echo "No git repository mentioned!"
fi
