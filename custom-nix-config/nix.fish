if test -n "$HOME" -a -n "$USER" 
    set NIX_LINK $HOME/.nix-profile
    set NIX_USER_PROFILE_DIR /nix/var/nix/profiles/per-user/$USER

    if test -n "$NIX_PATH"
      set -x NIX_PATH (NIX_PATH:+$NIX_PATH:)$HOME/.nix-defexpr/channels
    else
      set -x NIX_PATH $HOME/.nix-defexpr/channels
    end

    set -x NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"

    if [ -e /etc/ssl/certs/ca-certificates.crt ]
        set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
    else if [ -e /etc/ssl/ca-bundle.pem ]
        set -x NIX_SSL_CERT_FILE /etc/ssl/ca-bundle.pem
    else if [ -e /etc/ssl/certs/ca-bundle.crt ]
        set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-bundle.crt
    else if [ -e /etc/pki/tls/certs/ca-bundle.crt ]
        set -x NIX_SSL_CERT_FILE /etc/pki/tls/certs/ca-bundle.crt
    else if [ -e "$NIX_LINK/etc/ssl/certs/ca-bundle.crt" ]
        set -x NIX_SSL_CERT_FILE "$NIX_LINK/etc/ssl/certs/ca-bundle.crt"
    else if [ -e "$NIX_LINK/etc/ca-bundle.crt" ]
        set -x NIX_SSL_CERT_FILE "$NIX_LINK/etc/ca-bundle.crt"
    end

    if [ -n "(MANPATH-)" ]
        set -x MANPATH "$NIX_LINK/share/man:$MANPATH"
    end

    set -x PATH "$NIX_LINK/bin:$PATH"
    set -e NIX_LINK 
    set -e NIX_USER_PROFILE_DIR
end