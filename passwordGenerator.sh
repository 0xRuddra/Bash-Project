#!/bin/bash


function display_banner() {
    echo "******************************"
    echo "       Password Generator     "
    echo "******************************"
    echo ""
}

# Function to generate a random password
function generate_password() {
    local length=$1
    local charset=$2
    local password=""
    
    for ((i = 0; i < length; i++)); do
        random_index=$((RANDOM % ${#charset}))
        password="${password}${charset:${random_index}:1}"
    done

    echo "$password"
}

# Display the banner
display_banner


read -p "Enter the length of the password: " password_length
read -p "Enter the character set for the password: " user_charset

# Check if user provided a character set, use default if not
if [ -z "$user_charset" ]; then
    echo "enther the loop"
    user_charset="abcdefghijklmnopqrstwvxyzABCDEFGHIJKLMNOPQRSTWVXYZ0123456789"  
    # Default character set (alphanumeric)

fi

# Check if user provided a password length, use default if not
if [ -z "$password_length" ]; then
    password_length=8  # Default password length
fi

echo "pass-length: ${password_length} and characerterset: ${user_charset}"

# Generate and display the random password
password=$(generate_password "$password_length" "$user_charset")
echo "Generated Password: $password"


