if [ $# -lt 3 ]; then
	printf "usage:\n./urigen.sh label issuer pass_path\nenter secret key from standard in\n"
	exit 1
fi

read -s secret

secret=$(echo $secret | tr -d ' ')

echo "otpauth://totp/$1?secret=$secret&issuer=$2" | pass otp append $3 && pass otp code -c $3




