# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
 export LS_OPTIONS='--color=auto'
 eval "`dircolors`"
 alias ls='ls $LS_OPTIONS'
 alias ll='ls $LS_OPTIONS -lh'
 alias l='ls $LS_OPTIONS -lA'
# alias ftpovh='lftp -p PORT -u USER,PASSWORD FTP'
 alias monitor='bwm-ng -I eth0'
 alias iptabl='iptables -n -L -v --line-numbers'
 alias deliptabl='iptables -D INPUT'
 alias removeban='iptables -D fail2ban-ssh'
 alias syslog='tail -f /var/log/syslog'
 alias logapache='tail -f /var/log/apache2/error.log'
 alias df='df -h'
 alias compress='tar -cvzf'
 alias uncompress='tar -zxvf'
 alias vi='vim'
# alias mountftp='curlftpfs ftp://FTP /REPERTOIRELOCALE -o user=USER:PASSWORD'
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

##Auto-completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

##Mail Connection User
#IP=`echo $SSH_CONNECTION | awk '{print $1}'`
#MAIL='XYZ@domaine.com'
#IPWhitelist='XXX.XXX.XXX.XXX'
#IPWhitelist2='XXX.XXX.XXX.XXX'
#if [ "$IP" != "$IPWhitelist" ] && [ "$IP" != "$IPWhitelist2" };
#    then
#        echo "Connexion de $USER sur $HOSTNAME
#    IP: $IP
#    Date: $DATE" | mail -s "Connexion de $USER depuis $IP sur $HOSTNAME" $MAIL;
#fi

##Date + Heure d'execution de la commande dans le fichier bash_history
HISTTIMEFORMAT="%h/%d - %H:%M:%S "
##Alias Extraction archive courante
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
