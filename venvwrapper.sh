home=$VENVS_HOME

function workon {
  if [ $# -eq 0 ]
    then
      echo "Enviroment name needed"
  else
    venv=$1
    . $home/$venv/bin/activate
  fi
}

function mkvenv {
  if [ $# -eq 0 ]
    then
      echo "Enviroment name needed"
  else
    venv=$1
    python -m venv $home/$venv
    workon $venv
  fi
}

function rmvenv {
  if [ $# -eq 0 ]
    then
      echo "Enviroment name needed"
  else
    venv=$1
    command \rm -r $home/$venv
  fi

}

function lsvenvs {
  command \ls $VENVS_HOME
}
