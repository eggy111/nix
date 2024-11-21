# commands.nix
# in theory this should create some bash scripts for me...fingers crossed
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ # the blocks below create my own shell applications, thus they are listed within systemPackages

    (writeShellApplication {
      name = "wallpaper_setup";

      runtimeInputs = [ ]; # usually I think any dependencies are listed here

      text = ''
                
               DEFAULT_DIR="/home/eggy/.config/wallpapers"
               # if [[ ! -d $DIR ]]; then
               #    echo "Directory not found: $DIR"
               #    exit 1
               # fi

               export SWWW_TRANSITION_FPS=60
               export SWWW_TRANSITION_STEP=2

               INTERVAL=300

        while true; do
            find "$DEFAULT_DIR" -type f \
                | while read -r img; do
                    echo "$((RANDOM % 1000)):$img"
                done \
                | sort -n | cut -d':' -f2- \
                | while read -r img; do
                    swww img "$img" --transition-type random
                sleep $INTERVAL
            done
        done 
      '';
    })

    (writeShellApplication {
      name = "word-lookup";

      runtimeInputs = [ ];

      text = ''
        usage(){
            echo "Usage: $(basename "$0") [-h]
            Looks up the definition of currently selected word.
            -w: Use the wayland clipboard (instead of X11) "

        }
        USEWAYLAND=true

        while getopts 'hw' c
        do
            case $c in
                h) usage; exit ;;
                w) USEWAYLAND=true ;;
                *) usage; exit 1 ;;
            esac
        done

        shift $((OPTIND-1))

        if [ $USEWAYLAND = true ]
        then
            word=$(wl-paste -p)
        else
            word=$(xclip -o)
        fi

        res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
        regex=$'"definition":"\K(.*?)(?=")'
        definitions=$(echo "$res" | grep -Po "$regex")
        separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")
        notify-send -a "word-lookup" "$word" "$separatedDefinition"
      '';
    })
  ];
}
