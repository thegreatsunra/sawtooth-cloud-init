# Put this file in ~/.oh-my-zsh/custom/ and it will be loaded automatically
# Custom public aliases

# Edit this file
alias aliases="pico ~/.oh-my-zsh/custom/aliases.zsh"

# Start and stop all sawtooth services
alias startsawtooth="sudo systemctl start sawtooth-validator sawtooth-rest-api sawtooth-settings-tp sawtooth-identity-tp"
alias stopsawtooth="sudo systemctl stop sawtooth-validator sawtooth-rest-api sawtooth-settings-tp sawtooth-identity-tp"
alias start="startsawtooth"
alias stop="stopsawtooth"

# Start and stop sawtooth validator
alias startvalidator="sudo systemctl start sawtooth-validator"
alias stopvalidator="sudo systemctl stop sawtooth-validator"

# Journal/log all sawtooth services
alias journalsawtooth="sudo journalctl -f -u sawtooth-validator -u sawtooth-rest-api -u sawtooth-settings-tp -u sawtooth-identity-tp"
alias journalall="journalsawtooth"
alias logsawtooth="journalsawtooth"
alias logall="journalsawtooth"

# Journal/log sawtooth validator
alias journalvalidator="sudo journalctl -f -u sawtooth-validator"
alias journal="journalvalidator"
alias logvalidator="journalvalidator"

# Journal/log sawtooth rest api
alias journalrestapi="sudo journalctl -f -u sawtooth-rest-api"
alias journalapi="journalrestapi"

# Edit sawtooth validator config file
alias editvalidatorconfig="sudo pico /etc/sawtooth/validator.toml"
alias picovalidatorconfig="editvalidatorconfig"
alias nanovalidatorconfig="editvalidatorconfig"

# View validator config file
alias viewvalidatorconfig="sudo cat /etc/sawtooth/validator.toml"
alias catvalidatorconfig="viewvalidatorconfig"

# View sawtooth user's public key
alias viewpublickey="cat ~/.sawtooth/keys/sawtooth.pub"
alias viewpubkey="viewpublickey"
alias viewkey="viewpublickey"
alias catpublickey="viewpublickey"
alias catpubkey="viewpublickey"
alias catkey="viewpublickey"

# View system/validator's public key
alias viewvalidatorpublickey="sudo cat /etc/sawtooth/keys/validator.pub"
alias viewvalidatorpubkey="viewvalidatorpublickey"
alias viewvalidatorkey="viewvalidatorpublickey"
alias catvalidatorpublickey="viewvalidatorpublickey"
alias catvalidatorpubkey="viewvalidatorpublickey"
alias catvalidatorkey="viewvalidatorpublickey"

# View server's IP address
alias whatsmyip="ip addr show eth0 | grep -Eo 'inet [^/]+'"

# Update apt things
alias update="sudo apt update -y && sudo apt update -y"
alias upgrade="update"
