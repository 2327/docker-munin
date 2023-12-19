#!/usr/bin/env bash

if [[ -v MSMTP_HOST ]]; then
  (umask 66 \
  && echo "set sendmail=\"/usr/bin/msmtp\"" >> "${HOME}/.mailrc" \
  && echo "account default" >> "${HOME}/.msmtprc" \
  && if [[ -v MSMTP_HOST ]]; then echo "host ${MSMTP_HOST}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_PORT ]]; then echo "port ${MSMTP_PORT}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_TLS ]]; then echo "tls ${MSMTP_TLS}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_STARTTLS ]]; then echo "tls_starttls ${MSMTP_STARTTLS}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_CERTCHECK ]]; then echo "tls_certcheck ${MSMTP_CERTCHECK}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_AUTH ]]; then echo "auth ${MSMTP_AUTH}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_LOGIN ]]; then echo "user ${MSMTP_LOGIN}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_PASSWORD ]]; then echo "password ${MSMTP_PASSWORD}" >> "${HOME}/.msmtprc"; fi \
  && if [[ -v MSMTP_FROM ]]; then echo "from ${MSMTP_FROM}" >> "${HOME}/.msmtprc"; fi)
fi 

# TODO: node list generator

exec "$@"

