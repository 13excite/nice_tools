#!/bin/bash
localPATH='/git/git/'                                        # path of current directory
sep='---------------'                                   
  echo $sep"Processing" $d$sep
  remoteRepo="https://github.com/13excite/parse-mail.git"   

  cd $localPATH 
	git fetch --all && git clean -d -f

  lastLocalCommit=`git -C $localPATH rev-list HEAD | head -n 1`  # identify the last commit in master
  echo $lastLocalCommit
  lastRemoteCommit=`git -C $localPATH rev-list remotes/origin/HEAD | head -n 1`
  echo $lastRemoteCommit
  #load update info 
 
  if [[ "$lastLocalCommit" != "$lastRemoteCommit" ]]
     then
      echo "try pulling remote repo"
      cd $localPATH && git checkout master && git pull >> /var/log/cron/test.log
  else
      echo "local branch equally remote branch"
  fi

echo -e "\n"
