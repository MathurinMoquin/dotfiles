#!/bin/bash

# Function

function run() {
	$@ & disown
}

function runq() {
	run $@
	e
}

function asm() {
   local file="$1"
   local name="${file%.asm}"
   local outp="${name}.o"
   command nasm -f elf64 "$file" -o "$outp" && ld "$outp" -o "$name"
}

function pyenv() {
   command mkdir $1
   python3 -m venv $1
   command source $1/bin/activate
   command cd $1
}

function bn() {
   sudo brightnessctl -d "intel_backlight" set $1%
}

function c() {
   cl
   fastfetch
}

function cmk() {
   command mkdir $1
   command cd $1
}

function z() {
   command unzip $1
   command mkdir $1:0:-4
   command cd $1:0:-4
}


# Hyprland

function vim() {
    declare -A files
    files[h]="~/.config/hypr/hyprland.conf"
    files[i]="~/.config/i3/config"
    files[b]="~/.bashrc"
    files[v]="~/.vimrc"
	files[w]="~/.config/waybar/config.jsonc"
	files[s]="~/.config/waybar/style.css"
	files[a]="~/.config/zshrc/aliases.sh"
	files[f]="~/.config/zshrc/mfunctions.sh"

    local key="$1"
    local path="${files[$key]}"

    if [[ -v files[$key] ]]; then
		command nvim "${path/#\~/$HOME}"
    else
		filename="$1"
		if [[ "${filename##*.}" == "sh" ]]; then
			if [[ ! -e "$filename" ]]; then
				touch "$filename"
				printf "#!/bin/bash\n\n\n" >> "$filename"
			fi
		fi
		command nvim "$filename"
    fi
}

function cd() {
	if [[ $# -eq 0 ]]; then
		command cd
		return
	fi
    declare -A files
    files[h]="~/.config/hypr/"
    files[c]="~/.config/"
	files[w]="~/.config/waybar/"
	files[z]="~/.config/zshrc"
	files[s]="~/.scripts"
	files[n]="~/.config/nvim"

    local key="$1"
    local path="${files[$key]}"

    if [[ -v files[$key] ]]; then
		command cd "${path/#\~/$HOME}"
    else
		command cd $1
    fi
}

function apk() {
	./gradlew clean
	./gradlew assembleDebug
}

function compapk() {
	apk
	adb install -r app/build/outputs/apk/debug/app-debug.apk
}

function androidapp() {
	PROJECT_NAME="$1"
	WORD="REPLACE"

	cp -r ~/Programs/AndroidApps/.template "./$PROJECT_NAME"
	mv "./${PROJECT_NAME}/app/src/main/java/math/moq/REPLACE" "./${PROJECT_NAME}/app/src/main/java/math/moq/${PROJECT_NAME}"
	find "./$PROJECT_NAME" -type f -exec sed -i "s/${WORD}/${PROJECT_NAME}/g" {} +
}



function kotlin() {
	kotlinc $1 -include-runtime -d $2.jar
}

function kot() {
    if [ -e output.jar ]; then
        rm output.jar
    fi
    kotlinc *.kt -include-runtime -d output.jar
    java -jar output.jar
}

function jav() {
    javac math/moq/*.java -d class/
    jar cmf $1.jar manifest.txt class/*.class -d out/
    java -jar out/$1.jar
}

function esp32() {
    idf
    cp -r $IDF_PATH/examples/get-started/hello_world $1
    command cd $1
    idf.py set-target esp32
}

function flash() {
    idf.py build
    idf.py -p /dev/ttyUSB0 flash
}

function push() {
    branch="$1"
    msg="$2"
    git checkout -b $branch
    git add .
    git commit -m "($branch) $msg"
    git push origin $branch
}

lt ()
{
    du -sh * | sort -rh | head -n $1
}
