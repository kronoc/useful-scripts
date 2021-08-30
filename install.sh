ln -s ${HOME}/src/useful-scripts/bin ${HOME}/bin;
ln -s ${HOME}/src/useful-scripts/sbin ${HOME}/sbin;
echo "export PATH=${HOME}/bin:${HOME}/sbin:${PATH};" >> ${HOME}/.bashrc
source ${HOME}/.bashrc
