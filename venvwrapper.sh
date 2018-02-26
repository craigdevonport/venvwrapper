function vevnvs_check_venvs_dir {
  if [ ! -d "$VENVS_HOME/" ]
  then
    mkdir $VENVS_HOME
  fi
}

function workon {
  if [ $# -eq 0 ]
  then
      echo "Enviroment name needed"
  else
    venv=$1
    . $VENVS_HOME/$venv/bin/activate
  fi
}

function mkvenv {
  if [ $# -eq 0 ]
  then
      echo "Enviroment name needed"
  else
    if [ "$VENV_PYTHON" = "" ]
    then
        export VENV_PYTHON="$(command \which python)"
    fi
    vevnvs_check_venvs_dir
    venv=$1
    $VENV_PYTHON -m venv $VENVS_HOME/$venv
    workon $venv
  fi
}

function rmvenv {
  if [ $# -eq 0 ]
  then
      echo "Enviroment name needed"
  else
    venv=$1
    command \rm -r $VENVS_HOME/$venv
  fi

}

function lsvenvs {
  command \ls $VENVS_HOME
}
