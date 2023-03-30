#!/bin/sh -e
# ESET PROTECT
# Copyright (c) 1992-2022 ESET, spol. s r.o. All Rights Reserved

cleanup_file="$(mktemp -q)"
finalize()
{
  set +e
  if test -f "$cleanup_file"
  then
    while read f
    do
      rm -f "$f"
    done < "$cleanup_file"
    rm -f "$cleanup_file"
  fi
}

trap 'finalize' HUP INT QUIT TERM EXIT

eraa_server_hostname="10.96.34.32"
eraa_server_port="2222"
eraa_server_company_name=""
eraa_peer_cert_b64="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"
eraa_peer_cert_pwd=""
eraa_ca_cert_b64="MIIEqTCCAxGgAwIBAgIQNLqQ4WQ7o4dG9aIIFULu0zANBgkqhkiG9w0BAQsFADBtMScwJQYDVQQDEx5TZXJ2ZXIgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxDDAKBgNVBAsTA0ZSVDEMMAoGA1UEChMDRlJUMQwwCgYDVQQHEwNIQ00xCzAJBgNVBAgTAlZOMQswCQYDVQQGEwJWTjAeFw0yMjEwMDgxNzAwMDBaFw0zMjEwMDkxNzAwMDBaMG0xJzAlBgNVBAMTHlNlcnZlciBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTEMMAoGA1UECxMDRlJUMQwwCgYDVQQKEwNGUlQxDDAKBgNVBAcTA0hDTTELMAkGA1UECBMCVk4xCzAJBgNVBAYTAlZOMIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEApMgD7P3S23EkPjkwX3nnnndRai9GxrxC2Ebfl6s1h1WNFPBsHQIIEiK34JoZPlFG811hi4WxCc64GF0gZwwmiz81pfn4MKrHhn0Cb0V9z4F5sjkDbRJmlu/SJFlpKjA0Ubdg9CB9xjXOby5v2hr/eGjemI4D8y9Ou6bs5pkJODWz/5Qa44ETjRz3+iU62mT0AIhGfbDDXTi2oZ5EJiY00UY7QOm0PNfF52dFRnjEul8UKZjAkZl0EDUdZ9MD4kQpcUYokps+lk0h2h6BRO/NydGdHTDCiBGvtP9BpX9KrOfVCQtcJOJmmT/sE2mkZTD1EGUfGIiEjXtZy/9jbk83eIYlC67Xh4GAWQX5hxFuKSJALP/7GlTIjI0s0879GRsZtZCZejS1Y/BE69WI3zo2dUvhvS3t0haqBYMojmciicCvAjTATMQsvdo6aDcYQ02JAxAvidsWB9UoS1yTOj/ahubTssoagm2GSLIHD4TrA2j7hczcF9mQQDPHWJTURpGZAgMBAAGjRTBDMA4GA1UdDwEB/wQEAwIBBjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBQ/pfv0YEyQb30nwW7LfQn6GFLw+TANBgkqhkiG9w0BAQsFAAOCAYEAUkuRK8LRHYEQ+aK2iNdrNevXam2cmtC+i9pGfX6i1QG1xHoCflpHPF0wPUhZKIScy1nPg36KUSLb+zD8GThsnEXqJ97/Rty08hR9GxpAbV5wCuAB2fUgVBGbBkzyKatnAyX2oUx9b15duKfVm86EBKDoVNiAK4Prb8UiqRAg0tJaJs+JG9kfXSkwnXnEX+VgoKoVSS3aoD1//nxKFbzc4GNtGpzEfyFhiDIAD6xzpVhwbp576I1F++UmBwMWb96fQYeuvg6Az2+nEA5DEXZ+8Rj2hPJ1dLU1jYFEumCt7LDV/CETSiKddZrGHl1fnAdAMue9xSn891mUAqgB9N+2EZxCaYkOEkAyWcgzFXDIJpVm3aQDG8c+cDhRjHuyNaae58VDZGriTx+b+PBaQV1aiDYxpVGbk0nELil/qTT+rDkvkfwBGw3Jl65xY7IxEJd6dLnEGabR/a6acU2/y4GWl/ZT2Ro+NkrG/XyermGWCKNt0ifX5jOg3a52NTTwiDmx"
eraa_product_uuid=""
eraa_initial_sg_token=""
eraa_policy_data=""

arch=$(uname -m)
eraa_installer_url="http://repository.eset.com/v1/com/eset/apps/business/era/agent/v9/9.1.2304.0/agent_linux_i386.sh"
eraa_installer_checksum="74c5e2ea34be58eede4f27ec77c2ac81ed0892b5"

if $(echo "$arch" | grep -E "^(x86_64|amd64)$" 2>&1 > /dev/null)
then
    eraa_installer_url="http://repository.eset.com/v1/com/eset/apps/business/era/agent/v9/9.1.2304.0/agent_linux_x86_64.sh"
    eraa_installer_checksum="817d522e191df01606bb6d15b0f75a77d0d52369"
fi

echo "ESET Management Agent live installer script. Copyright © 1992-2022 ESET, spol. s r.o. - All rights reserved."

if test ! -z $eraa_server_company_name
then
  echo " * CompanyName: $eraa_server_company_name"
fi
echo " * Hostname: $eraa_server_hostname"
echo " * Port: $eraa_server_port"
echo " * Installer: $eraa_installer_url"
echo

if test -z $eraa_installer_url
then
  echo "No installer available for '$arch' arhitecture."
  exit 1
fi

local_cert_path="$(mktemp -q -u)"
echo $eraa_peer_cert_b64 | base64 -d > "$local_cert_path" && echo "$local_cert_path" >> "$cleanup_file"

if test -n "$eraa_ca_cert_b64"
then
  local_ca_path="$(mktemp -q -u)"
  echo $eraa_ca_cert_b64 | base64 -d > "$local_ca_path" && echo "$local_ca_path" >> "$cleanup_file"
fi


eraa_http_proxy_value="http://10.96.34.32:3128"

local_installer="$(dirname $0)"/"$(basename $eraa_installer_url)"

if $(echo "$eraa_installer_checksum  $local_installer" | shasum -c 2> /dev/null > /dev/null)
then
    echo "Verified local installer was found: '$local_installer'"
else
    local_installer="$(mktemp -q -u)"

    echo "Downloading ESET Management Agent installer..."

    if test -n "$eraa_http_proxy_value"
    then
      export use_proxy=yes
      export http_proxy="$eraa_http_proxy_value"
      (wget --connect-timeout 300 --no-check-certificate -O "$local_installer" "$eraa_installer_url" || wget --connect-timeout 300 --no-proxy --no-check-certificate -O "$local_installer" "$eraa_installer_url" || curl --fail --connect-timeout 300 -k "$eraa_installer_url" > "$local_installer") && echo "$local_installer" >> "$cleanup_file"
    else
      (wget --connect-timeout 300 --no-check-certificate -O "$local_installer" "$eraa_installer_url" || curl --fail --connect-timeout 300 -k "$eraa_installer_url" > "$local_installer") && echo "$local_installer" >> "$cleanup_file"
    fi

    if test ! -s "$local_installer"
    then
       echo "Failed to download installer file"
       exit 2
    fi

    echo -n "Checking integrity of installer script " && echo "$eraa_installer_checksum  $local_installer" | sha1sum -c
fi

chmod +x "$local_installer"

command -v sudo > /dev/null && usesudo="sudo -E" || usesudo=""

export _ERAAGENT_PEER_CERT_PASSWORD="$eraa_peer_cert_pwd"

echo
echo Running installer script $local_installer
echo

$usesudo /bin/sh "$local_installer"\
   --skip-license \
   --hostname "$eraa_server_hostname"\
   --port "$eraa_server_port"\
   --cert-path "$local_cert_path"\
   --cert-password "env:_ERAAGENT_PEER_CERT_PASSWORD"\
   --cert-password-is-base64\
   --initial-static-group "$eraa_initial_sg_token"\
   --proxy-hostname '10.96.34.32' --proxy-port 3128 \
   --enable-imp-program\
   $(test -n "$local_ca_path" && echo --cert-auth-path "$local_ca_path")\
   $(test -n "$eraa_product_uuid" && echo --product-guid "$eraa_product_uuid")\
   $(test -n "$eraa_policy_data" && echo --custom-policy "$eraa_policy_data")
