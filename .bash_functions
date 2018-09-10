## Functions
function cd() {
    builtin cd $@ && ls
}

# Back up a file. Usage "backfile filename.txt"
backupthis ()
{
    cp $1 ${1}-`date +%Y%m%d%H%M`.backup;
}

clean() {
rm -rf "$HOME/.cache/"
rm -rf "$HOME/.thumbnails"
rm -rf "$HOME/.local/share/Trash"
}

md_to_pdf() {
pandoc --latex-engine=xelatex -V mainfont="Times New Roman" -V fontsize=12pt -V geometry:margin=1in -V documentclass=article -V linestrech=1.5 -V link-as-notes $1.md -s -o $2.pdf
}

# Create a new directory and enter it
mkd() { mkdir $1 && cd $1; }

gacp () {
  git add --all --verbose
  git commit -m "$1"
  git push -u origin HEAD
}
## Interesting bash function for setting up a new front-end project
# Usage: new_project DIRNAME DESCRIPTION
function new_project() {
  git init "$1" && \
	  pushd "$1" && \
	  echo "$2" > README.txt && \
	  echo "$2" > .git/description && \
	  echo "/node_modules/" >> .gitignore && \
	  hub create -d "$2" && \
	  yarn init && \
	  gacp initial
}

# Create new web project folder and grab html5 boilerplate
website() {
mkdir $1
cd $1
git init
git remote add origin https://github.com/Gazaunga/HTML5-Boilerplate.git
git pull origin master
ls -a
$EDITOR index.html
}

# Tar extraction
extract() {      # Handy Extract Program
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
	);

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

scripter()
{
    if [ -n "$1" ]; then
        local script="$1"
    else
        local script=`mktemp scriptster.rb.XXXX`
    fi

    local url="https://raw.githubusercontent.com/pazdera/scriptster/master"
    curl "$url/examples/minimal-template.rb" >"$script"
    #curl "$url/examples/documented-template.rb" >"$script"

    chmod +x "$script"
    $EDITOR "$script"
}

blame() {
 systemd-analyze
systemd-analyze blame
systemd-analyze critical-chain
systemd-analyze plot > plot.svg 
}
