#!/bin/bash

digem() {
declare -A thumb_war
thumb_war=(
        [_cloudflare]="1.1.1.1"
        [_google]="8.8.8.8"
        [_ibm]="9.9.9.9"
        [_yandex]="77.88.8.8"
)
declare -A recs
recs=(
          [k1]="TXT"
          [k2]="CNAME"
          [k3]="A"
          [k4]="SRV"
          [k5]="AAAA"
          [k6]="DNSSEC"
          [k7]="NS"
          [k8]="MX"
)
for i in "${!recs[@]}"; do
        for key in "${!thumb_war[@]}" ; do echo "Digging ${recs[$i]}  $1 @$key:${thumb_war[$key]}"
                  dig  +noall +answer $1 $2 @${thumb_war[$key]} ${recs[$i]}

done

done
unset thumb_war
unset recs
}
