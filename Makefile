NAME=           openwinfs
BINNAME?=       openwinfs
MYBINDIR?=      ./bin
MYWORKFLOWDIR?= ./workflow
WORKFLOWCOPY1?= Copy\ WinFsPath.workflow
WORKFLOWOPEN1?= Open\ WinFsPath\ \(Auth\).workflow
WORKFLOWOPEN2?= Open\ WinFsPath\ \(Guest\).workflow

LOCALBASE?=     /usr/local
BINDIR?=        ${LOCALBASE}/bin
MNTDIR?=        /mnt_openwinfs
INSTALL?=       /usr/bin/install
MKDIR?=         /bin/mkdir -p
RMDIR?=         /bin/rmdir
RM?=            /bin/rm -f
RMR?=           /bin/rm -rf
CHMOD?=         /bin/chmod
CPR?=           /bin/cp -r
WORKFLOWDIR?=   ~/Library/Services


INSTALL_PROGRAM=${INSTALL} -m ${BINMODE}
INSTALL_DOCS=   ${INSTALL} -m ${DOCMODE}
BINMODE=        555
DOCMODE=        444
DIRMODE=        777

install: ${MYBINDIR}/${BINNAME}
	${MKDIR} ${MNTDIR}
	${CHMOD} ${DIRMODE} ${MNTDIR}
	${INSTALL_PROGRAM} ${MYBINDIR}/${BINNAME} ${STAGEDIR}${BINDIR};
	${CPR} ${MYWORKFLOWDIR}/${WORKFLOWCOPY1} ${WORKFLOWDIR}
	${CPR} ${MYWORKFLOWDIR}/${WORKFLOWOPEN1} ${WORKFLOWDIR}
	${CPR} ${MYWORKFLOWDIR}/${WORKFLOWOPEN2} ${WORKFLOWDIR}

uninstall: ${BINDIR}/${BINNAME}
	${RM} ${STAGEDIR}${BINDIR}/${BINNAME};
	${RMR} ${WORKFLOWDIR}/${WORKFLOWCOPY1}
	${RMR} ${WORKFLOWDIR}/${WORKFLOWOPEN1}
	${RMR} ${WORKFLOWDIR}/${WORKFLOWOPEN2}

deinstall: uninstall
